resource "aws_security_group" "ciim_maria_db_sg" {
    name        = "ciim-maria-db-sg"
    description = "allow ciim to talk to maria db"
    vpc_id      = var.ciim_vpc_id

    tags = merge(var.tags, {
        Name = "ciim-maria-db-s"
    })
}

resource "aws_security_group_rule" "ingress_maria_db_cidr" {
  type              = "ingress"
  from_port         = "3306"
  to_port           = "3306"
  protocol          = "tcp"
  cidr_blocks       = var.maria_db_cidr_block
  security_group_id = aws_security_group.ciim_maria_db_sg.id
  description       = "access to maria db on port 3306"
}

resource "aws_security_group_rule" "ssh_ingress_maria_db_cidr" {
  type              = "ingress"
  from_port         = "22"
  to_port           = "22"
  protocol          = "tcp"
  cidr_blocks       = var.maria_db_cidr_block
  security_group_id = aws_security_group.ciim_maria_db_sg.id
  description       = "access to maria db on port 22"
}
