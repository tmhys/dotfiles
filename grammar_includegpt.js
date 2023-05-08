module.exports = grammar({
  name: 'seq',

  rules: {
    // ...省略...

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
    // ...省略...
    $.preprocessor_statement,
  ],

  inline: $ => [
    // ...省略...
    $.sequence_file,
    $.filename,
  ],

  preprocessor: {
    load: (filepath, _callbacks) => {
      // 同階層の"sequence"と記載のあるファイルを読み込み、
      // 全体のファイルを配列に連結する
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

    // #includeで指定されたファイルを挿入する
    // インクルードファイルからのインクルードはできない
    define: (_filepath, code) => {
      return code.replace(/#include\s*"([^"]+)"/g, (match, p1) => {
        const includeFilePath = path.join(path.dirname(_filepath), p1);
        return fs.readFileSync(includeFilePath, 'utf-8');
      });
    },
  },
});
