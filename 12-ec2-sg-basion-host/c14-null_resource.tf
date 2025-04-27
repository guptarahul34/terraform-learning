resource "null_resource" "ssh_login" {
  # to perform tasks without creating resources in terraform
  depends_on = [ module.basion_host_instance ]
  connection {
    type = "ssh"
    host = module.basion_host_instance.public_ip
    user = "ec2-user"
    password = ""
    private_key = file("put your file name here.")
  }
  # with above connection block you will be able to make ssh connection

  # File Provisioner 
  provisioner "file" {
    source      = "./node1.pem"
    destination = "/tmp/node1.pem"
  }

  # remote-exec provisioner

  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/node1.pem"
    ]
  }

  #local-exec provisioner
  provisioner "local-exec" {
    command = "echo ${module.basion_host_instance.public_ip} >> public_ips.txt"
  }

}
