resource "aws_instance" "Instance1" {
    ami = "ami-01bc990364452ab3e"   #us-east-1
    instance_type="t2.micro"
    vpc_security_group_ids=[aws_security_group.east_2_sg.id]
    provider = aws.northvirginia

    depends_on = [ aws_iam_user.iam_user ]
    
    tags={
        Name = "Instance_us_east"
        Enviroment = "Staging"
    }
}

resource "aws_instance" "Instance2" {
    ami = "ami-08cba41c585e4a2e2"   #us-east-2 ohio
    instance_type="t2.micro"
    depends_on = [ aws_iam_user.iam_user ]
    vpc_security_group_ids=[aws_security_group.east_1_sg.id]
    provider = aws
    tags={
        Name = "Instance_us_east_2"
        Enviroment = "Staging"
    }
}
