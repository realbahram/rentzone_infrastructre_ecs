# create the subnet group for the rds instance
resource "aws_db_subnet_group" "database_subnet_group" {
  name        = "database-subnets"
  subnet_ids  = [aws_subnet.private_data_subnet_az1.id, aws_subnet.private_data_subnet_az2.id]
  description = "subnets for database instance"

  tags = {
    Name = "database-subnets"
  }
}

# create the rds instance
resource "aws_db_instance" "db_instance" {
  engine                 = "mysql"
  engine_version         = "8.0.40"
  multi_az               = false
  identifier             = "dev-rds-instance"
  username               = "bahram"      # create username
  password               = "bahram123"   # create password
  instance_class         = "db.t3.micro" # review what class works best for you 
  allocated_storage      = 200
  db_subnet_group_name   = aws_db_subnet_group.database_subnet_group.name
  vpc_security_group_ids = [aws_security_group.database_security_group.id]
  availability_zone      = data.aws_availability_zones.available_zones.names[0]
  db_name                = "applicationdb"
  skip_final_snapshot    = true #this will make it so an additional snapshot is not created after every stoppage of this instance
}