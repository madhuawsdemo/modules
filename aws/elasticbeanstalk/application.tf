resource "aws_elastic_beanstalk_application" "application" {
    name = var.eb-application
    description = var.eb-application_description
    tags = {

        Name = var.application
    }
    appversion_lifecycle {
        service_role = "aws-elasticbeanstalk-service-role"
        max_age_in_days = "30"
        delete_source_from_s3 = "true"    
    }  
}
