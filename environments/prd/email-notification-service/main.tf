module "lambda_function" {
  source = "../../../modules/email-notification-service"

  name          = "email-notification-service"
  handler       = "com.cairnfg.waypoint.emailservice.HandlerWaypointEmailService::handleRequest"
}


output "sqs_queue_url" {
  value = module.lambda_function.sqs_queue_url
}