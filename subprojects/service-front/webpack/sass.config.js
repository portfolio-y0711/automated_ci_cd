const { inputPath, outputPath } = require('./config')
const path = require('path')

module.exports = {
    devtool: 'source-map',
    module: {
        rules: [
            {
                test: /\.(sass|scss|css)$/,
                use: [
                    {
                        loader: MiniCssExtractPlugin.loader
                    }, 
                    {
                        loader: 'css-loader',
                        options: {
                            modules: false,
                            sourceMap: true
                        }
                    }, 
                    {
                        loader: 'postcss-loader',
                        options: {
                            sourceMap: true
                        }
                    }, 
                    {
                        loader: 'sass-loader',
                        options: {
                            sourceMap: true
                        }
                    },
                ]
            }
        ]
    }
}
