
// LAMBDA
variable "mdbserver" {}
resource "local_file" "config" {
  content = templatefile("../glow/index.tftpl", {
    mdbserver = var.mdbserver
  })
  filename = "../glow/index.py"
}

data "archive_file" "lambda" {
    type = "zip"
    source_dir = "../glow"
    output_path = "../glow.zip"
    excludes    = ["../glow/index.tftpl"]
    depends_on = [
      local_file.config
    ]
}

resource "aws_lambda_layer_version" "lambda_layer" {
    filename = "../lambda_layer.zip"
    layer_name = "glowbal_layer"
    compatible_runtimes = ["python3.12"]
    source_code_hash = filebase64sha256("../lambda_layer.zip")
}

resource "aws_lambda_function" "lambda" {
    filename = "../glow.zip"
    function_name = "glowbal"
    role = aws_iam_role.lambda.arn
    handler       = "index.handler"
    source_code_hash = data.archive_file.lambda.output_base64sha256
    runtime       = "python3.12"
    layers = [aws_lambda_layer_version.lambda_layer.arn]
    timeout = 30
}
