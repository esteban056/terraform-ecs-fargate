resource "aws_db_instance" "mysql_db" {
  allocated_storage   = 40 # gigabytes
  #snapshot_identifier = var.db_snapshot_identifier
  deletion_protection = true
  max_allocated_storage = 100
  engine              = "mysql"
  engine_version      = var.db_version
  identifier          = "${var.db_identifier}"
  instance_class      = "db.t2.micro"
  password            = var.db_password
  skip_final_snapshot = true
  storage_encrypted   = false
  port                = var.db_port
  username            = var.db_user
  vpc_security_group_ids  = [ "sg-278da87f"]#,aws_security_group.bd_sg.id ]
  auto_minor_version_upgrade = false

  publicly_accessible     = true
  #db_subnet_group_name    = aws_db_subnet_group.public_subnet_group.name

  enabled_cloudwatch_logs_exports       = [
          "error",
          "general",
          "slowquery",
        ]
}