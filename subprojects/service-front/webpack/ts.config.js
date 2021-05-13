const path = require('path')

module.exports = {
    devtool: 'source-map',
    module: {
      rules: [
        {
          test: /\.tsx?$/,
          use: "ts-loader",
          exclude: /node_modules/,
        },
      ],
    }
}
