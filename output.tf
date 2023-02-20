output "instance_id_list" {
  value = ["${aws_instance.jyo-ec2-1.*.id}"]
}

output "instance_second_id_list" {
  value = ["${aws_instance.jyo-ec2-2.*.id}"]
}