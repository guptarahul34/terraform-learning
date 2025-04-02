resource "aws_instance" "ec2instancedemo" {
    ami = "ami-00a929b66ed6e0de6"
    instance_type = "t2.micro"
    user_data = file("${path.module}/httpd.sh")
    vpc_security_group_ids = ["sg-048149c50821f1a70"]
    tags = {
        "Name" = "DemoServer"
    }
}