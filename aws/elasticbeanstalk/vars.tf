variable "eb-application" {}
variable "eb-application_description" {}
variable "eb-environment" {}
variable "eb-environment_description" {}


##################################################################################################
        #Elastic Beanstalk variables for theses sections:
            # 1. software
            # 2. instances
            # 3. capacity
            # 4. loadbalancer
            # 5. rolling updates and deplyoment
            # 6. security
            # 7. monitoring
            # 8. managed updates
            # 9. notifications
            # 10. network
            # 11. database
 ##################################################################################################
# 1. Software
        # NodeJS environment variable
        variable "node_command" {}
        variable "node_version" {}
        variable "Gzip_compression" {}
        variable "proxy_server" {}
        variable "xray_enabled" {}

        #Environment log streaming
        variable "enable_env_log_stream" {}
        variable "delete_logs_on_terminate" {}
        variable "log_retention" {}

        # Send logs to S3 
        variable "store_logs_in_s3" {}
        #Set environment variables
        #variable "env_vars" {}
#2. Instance settings
    #   Variables for ec2 instance        
        variable "instance_type" {}
        variable "ami_id" {}
        variable "monitoring_interval" {}
    #   Variables for root volume
        variable "instance_volume_type" {}
        variable "instance_volume_size" {}
        variable "instance_volume_iops" {}
    #   Variable for ec2 security groups
        variable "ec2_security_groups" {}
        variable "eb_solution_stack_name" {}
# 3. Capacity(variables for autoscaling group)
        variable "environmentType" {}
        variable "min_instance" {}
        variable "max_instance" {}
        variable "available_az" {}
      #  variable "custom_az" {}        
        variable "scale_down" {}

    #   trigger based scaling
        variable "trigger_metric" {}
        variable "trigger_stat" {}
        variable "trigger_unit" {}
        variable "trigger_period" {}
        variable "trigger_breachduration" {}
        variable "trigger_upper_threshold" {}
        variable "trigger_scale_up_increament" {}
        variable "trigger_lower_threshold" {}
        variable "trigger_scale_down_increament" {}
    #   time based scaling
        variable "time_start" {}
        variable "time_end" {}
        variable "time_max" {}
        variable "time_min" {}
        variable "time_desired_capacity" {}
        variable "time_recurrence" {}
        variable "time_suspend" {}

# 4. Load balancer
        variable "loadBalancerType" {}
        variable "protocol" {}
        variable "listener_enabled" {}
       # variable "loadbalancer_certificate_arn" {}
        variable "alb_security_groups" {
        
         }
        variable "managed_alb_security_groups" {}
        variable "default_alb_process_443" {}
        variable "default_alb_process_80" {}
        variable "DeregistrationDelay" {}
variable "HealthCheckInterval" {}
variable "HealthCheckPath" {}
variable "HealthCheckTimeout" {}
variable "HealthyThresholdCount" {}
variable "MatcherHTTPCode" {}
variable "Port" {}
variable "Protocol" {}
variable "StickinessEnabled" {}
variable "StickinessLBCookieDuration" {}
variable "StickinessType" {}
variable "UnhealthyThresholdCount" {}        

        #variable "alb_rules" {}
        #variable "alb_ssl_policy" {}
        # variable "alb_access_log_s3_bucket" {}
        # variable "alb_access_log_s3_enabled" {}
        # variable "alb_access_log_s3_prefix" {}
        variable "alb_timeout" {}

#5. Rolling updates and deployment
    # Deployment policy
        variable "deployment_policy" {}
        variable "deployment_batch_size" {}
        variable "deployment_batch_size_type" {}
                
    # Rolling updates
        variable "rolling_update_enabled" {}
        variable "rolling_update_type" {}
        variable "max_batchsize" {}
        variable "min_batchsize" {}
        variable "pause_time" {}
        variable "deployment_ignore_health_check" {}
        variable "deployment_health_threshold" {}
        variable "deployment_timeout" {}
#6. Security
        variable "instance_profile_role" {}
        variable "service_profile_role" {}
        variable "ssh_key_name" {}
#7. Monitoring
        #Health reporting
        variable "healthcheck_type" {}
        variable "config_document" {}
        variable "healthCheck_success_threshold" {}
#8. Managed updates
#9. Notification
        variable "notification_endpoint" {}
        variable "notification_protocol" {}
        # variable "notification_topic_arn" {}
        # variable "notification_topic_name" {}    

# 10. Variables for network settings(vpc, subnets, elb subnets, and ELB/ALB visibility)
        variable "vpc_id" {}
        variable "elb_visibility" {}
        variable "public_ip" {}
        
        variable "eb-ec2-subnet-1" {}
        variable "eb-ec2-subnet-2" {}
        variable "eb-alb-subnet-1" {}
        variable "eb-alb-subnet-2" {}
        variable "eb-public-alb-subnet-3" {}
        variable "eb-public-alb-subnet-4" {}

#11. Database
