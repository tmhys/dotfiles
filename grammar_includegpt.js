module.exports = grammar({
  name: 'seq',

  rules: {
    // ...�ȗ�...

    preprocessor_statement: $ => choice(
      $.include_statement,
      $.sequence_statement
    ),

    include_statement: $ => seq(
      '#',
      'include',
      '"',
      field('filename', /[^\n"]+/),
      '"'
    ),

    sequence_statement: $ => seq(
      'sequence',
      field('sequence_file', /[^\n]+/)
    ),
  },

  extras: $ => [
    // ...�ȗ�...
    $.preprocessor_statement,
  ],

  inline: $ => [
    // ...�ȗ�...
    $.sequence_file,
    $.filename,
  ],

  preprocessor: {
    load: (filepath, _callbacks) => {
      // ���K�w��"sequence"�ƋL�ڂ̂���t�@�C����ǂݍ��݁A
      // �S�̂̃t�@�C����z��ɘA������
      if (filepath.endsWith('.mylang')) {
        const input = fs.readFileSync(filepath, 'utf-8');
        const match = input.match(/^sequence\s+(\S+)/m);
        if (match) {
          const sequenceFilePath = path.join(path.dirname(filepath), match[1]);
          const sequenceFileContent = fs.readFileSync(sequenceFilePath, 'utf-8');
          return Buffer.from(`${sequenceFileContent}\n${input}`);
        }
        return input;
      }
    },

    // #include�Ŏw�肳�ꂽ�t�@�C����}������
    // �C���N���[�h�t�@�C������̃C���N���[�h�͂ł��Ȃ�
    define: (_filepath, code) => {
      return code.replace(/#include\s*"([^"]+)"/g, (match, p1) => {
        const includeFilePath = path.join(path.dirname(_filepath), p1);
        return fs.readFileSync(includeFilePath, 'utf-8');
      });
    },
  },
});
