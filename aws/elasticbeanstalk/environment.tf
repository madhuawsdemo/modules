resource "aws_elastic_beanstalk_environment" "environment" {
    name = var.eb-environment
    application = aws_elastic_beanstalk_application.application.name
    description = var.eb-environment_description
    solution_stack_name = var.eb_solution_stack_name
    cname_prefix = var.eb-environment
    tier = "WebServer"
    wait_for_ready_timeout  = "60m"
    
##################################################################################################
#Elastic Beanstalk settings for theses sections:
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
# 1. Software related settings here

    #   Container options
        setting{
            namespace = "aws:elasticbeanstalk:container:nodejs"
            name = "NodeCommand"
            value = var.node_command
        }
        setting{
            namespace = "aws:elasticbeanstalk:container:nodejs"
            name = "NodeVersion"
            value = var.node_version
        }        
        setting{
            namespace = "aws:elasticbeanstalk:container:nodejs"
            name = "GzipCompression"
            value = var.Gzip_compression
        }
        setting{
            namespace = "aws:elasticbeanstalk:container:nodejs"
            name = "ProxyServer"
            value = var.proxy_server
        }
    #   X-Ray setting
        setting{
            namespace = "aws:elasticbeanstalk:xray"
            name = "XRayEnabled"
            value = var.xray_enabled
        }
    #   Environment log streaming to CloudWatch Logs
        setting {
            namespace = "aws:elasticbeanstalk:cloudwatch:logs"
            name = "StreamLogs"
            value = var.enable_env_log_stream
        }
        setting { 
            namespace = "aws:elasticbeanstalk:cloudwatch:logs"
            name = "DeleteOnTerminate"
            value = var.delete_logs_on_terminate
        }        
        setting {
            namespace = "aws:elasticbeanstalk:cloudwatch:logs"
            name = "RetentionInDays"
            value = var.log_retention
        }   
        setting {
            namespace = "aws:elasticbeanstalk:hostmanager"
            name = "LogPublicationControl"
            value = var.store_logs_in_s3
        }     
        #Environment properties
       
        setting { 
        namespace = "aws:elasticbeanstalk:application:environment" 
        name = "RWD_WEB_GRAPHQL_API_REGION" 
        value = "us-east-2 " 
        }        
    

# 2. Instances 
    #   ec2 instance settings
        setting {
            namespace = "aws:autoscaling:launchconfiguration"
            name = "InstanceType"
            value = var.instance_type
        }
    #   AMI ID
        setting {
            namespace = "aws:autoscaling:launchconfiguration"
            name = "ImageId"
            value = var.ami_id
        }
    #   Cloudwatch monitoring interval
        setting {
            namespace = "aws:autoscaling:launchconfiguration"
            name = "MonitoringInterval"
            value = var.monitoring_interval
        }
    #   Root volume
         setting {
            namespace = "aws:autoscaling:launchconfiguration"
            name = "RootVolumeType"
            value = var.instance_volume_type
        }
        setting {
            namespace = "aws:autoscaling:launchconfiguration"
            name = "RootVolumeSize"
            value = var.instance_volume_size
        }
        setting {
            namespace = "aws:autoscaling:launchconfiguration"
            name = "RootVolumeIOPS"
            value = var.instance_volume_iops
        }   
    #   EC2 security groups
         setting {
            namespace = "aws:autoscaling:launchconfiguration"
            name = "SecurityGroups"
            value = var.ec2_security_groups
        }
# 3. Capacity(autoscaling)
    # Autoscaling group settings
        setting{
            namespace = "aws:elasticbeanstalk:environment"
            name = "EnvironmentType"
            value = var.environmentType
        }
         setting {
            namespace = "aws:autoscaling:asg"
            name = "MinSize"
            value = var.min_instance
        }
        setting {
            namespace = "aws:autoscaling:asg"
            name = "MaxSize"
            value = var.max_instance
        }
        setting {
            namespace = "aws:autoscaling:asg"
            name = "Availability Zones"
            value = var.available_az
        }
        # setting {
        #     namespace = "aws:autoscaling:asg"
        #     name = "Custom Availability Zones"
        #     value = var.custom_az
        # }
        setting {
            namespace = "aws:autoscaling:asg"
            name = "Cooldown"
            value = var.scale_down
        }
    #   Scaling triggers
        #   Trigger based scaling
         setting {
            namespace = "aws:autoscaling:trigger"
            name = "MeasureName"
            value = var.trigger_metric
        }
         setting {
            namespace = "aws:autoscaling:trigger"
            name = "Statistic"
            value = var.trigger_stat
        }
        setting {
            namespace = "aws:autoscaling:trigger"
            name = "Unit"
            value = var.trigger_unit
        }
        setting {
            namespace = "aws:autoscaling:trigger"
            name = "Period"
            value = var.trigger_period
        }
         setting {
            namespace = "aws:autoscaling:trigger"
            name = "BreachDuration"
            value = var.trigger_breachduration
        }
        setting {
            namespace = "aws:autoscaling:trigger"
            name = "UpperThreshold"
            value = var.trigger_upper_threshold
        }
        setting {
            namespace = "aws:autoscaling:trigger"
            name = "UpperBreachScaleIncrement"
            value = var.trigger_scale_up_increament
        }
         setting {
            namespace = "aws:autoscaling:trigger"
            name = "LowerThreshold"
            value = var.trigger_lower_threshold
        }
        setting {
            namespace = "aws:autoscaling:trigger"
            name = "LowerBreachScaleIncrement"
            value = var.trigger_scale_down_increament
        }      
        #   Time based scaling
        		
        # setting {
        #     namespace = "aws:autoscaling:scheduledaction"
        #     name = "StartTime"
        #     value = var.time_start
        # }
        # setting {
        #     namespace = "aws:autoscaling:scheduledaction"
        #     name = "EndTime"
        #     value = var.time_end
        # }
        #  setting {
        #     namespace = "aws:autoscaling:scheduledaction"
        #     name = "MaxSize"
        #     value = var.time_max
        # }
        # setting {
        #     namespace = "aws:autoscaling:scheduledaction"
        #     name = "MinSize"
        #     value = var.time_min
        # }
        # setting {
        #     namespace = "aws:autoscaling:scheduledaction"
        #     name = "DesiredCapacity"
        #     value = var.time_desired_capacity
        # }
        #  setting {
        #     namespace = "aws:autoscaling:scheduledaction"
        #     name = "Recurrence"
        #     value = var.time_recurrence
        # }
        # setting {
        #     namespace = "aws:autoscaling:scheduledaction"
        #     name = "Suspend"
        #     value = var.time_suspend
        # }  
        
# 4. loadbalancer 
    #application load-balancer settings
        
        setting{
            namespace = "aws:elasticbeanstalk:environment"
            name = "LoadBalancerType"
            value = var.loadBalancerType
        }

         setting {
            namespace = "aws:elbv2:listener:443"
            name = "ListenerEnabled"
            value = var.listener_enabled
        }   
          
        setting {
            namespace = "aws:elbv2:listener:443"
            name = "Protocol"
            value = var.protocol
        }
        setting {
            namespace = "aws:elbv2:listener:443"
            name = "SSLCertificateArns"
            value = "arn:aws:acm:us-east-2:812436859307:certificate/52ec6628-7646-4155-a3d9-31fe68333f50"
        }
    # Process settings 443
         setting {
            namespace = "aws:elbv2:listener:443"
            name = "DefaultProcess"
            value = var.default_alb_process_443
        }
     # Process settings default:80
         setting {
            namespace = "aws:elbv2:listener:default"
            name = "DefaultProcess"
            value = var.default_alb_process_80
        }
       ########## Default process ##################
            setting { 
        namespace = "aws:elasticbeanstalk:environment:process:default" 
        name = "DeregistrationDelay" 
        value = var.DeregistrationDelay 
        }
        setting { 
        namespace = "aws:elasticbeanstalk:environment:process:default" 
        name = "HealthCheckInterval" 
        value = var.HealthCheckInterval 
        }
        setting { 
        namespace = "aws:elasticbeanstalk:environment:process:default" 
        name = "HealthCheckPath" 
        value = var.HealthCheckPath 
        }
        setting { 
        namespace = "aws:elasticbeanstalk:environment:process:default" 
        name = "HealthCheckTimeout" 
        value = var.HealthCheckTimeout 
        }
        setting { 
        namespace = "aws:elasticbeanstalk:environment:process:default" 
        name = "HealthyThresholdCount" 
        value = var.HealthyThresholdCount 
        }
        setting { 
        namespace = "aws:elasticbeanstalk:environment:process:default" 
        name = "MatcherHTTPCode" 
        value = var.MatcherHTTPCode 
        }
        setting { 
        namespace = "aws:elasticbeanstalk:environment:process:default" 
        name = "Port" 
        value = var.Port 
        }
        setting { 
        namespace = "aws:elasticbeanstalk:environment:process:default" 
        name = "Protocol" 
        value = var.Protocol 
        }
        setting { 
        namespace = "aws:elasticbeanstalk:environment:process:default" 
        name = "StickinessEnabled" 
        value = var.StickinessEnabled 
        }
        setting { 
        namespace = "aws:elasticbeanstalk:environment:process:default" 
        name = "StickinessLBCookieDuration" 
        value = var.StickinessLBCookieDuration 
        }
        setting { 
        namespace = "aws:elasticbeanstalk:environment:process:default" 
        name = "StickinessType" 
        value = var.StickinessType 
        }
        setting { 
        namespace = "aws:elasticbeanstalk:environment:process:default" 
        name = "UnhealthyThresholdCount" 
        value = var.UnhealthyThresholdCount 
        }
       ########## Default process ##################
       
        
        



    # Rules
        # setting {
        #     namespace = "aws:elbv2:listener:443"
        #     name = "Rules"
        #     value = var.alb_rules
        # }
    # Policy
        # setting {
        #     namespace = "aws:elbv2:listener:443"
        #     name = "SSLPolicy"
        #     value = var.alb_ssl_policy
        # }  
        setting {
            namespace = "aws:elbv2:loadbalancer"
            name = "SecurityGroups"
            value = var.alb_security_groups
        }
        setting {
            namespace = "aws:elbv2:loadbalancer"
            name = "ManagedSecurityGroup"
            value = var.managed_alb_security_groups
        }
        # setting {
        #     namespace = "aws:elbv2:loadbalancer"
        #     name = "AccessLogsS3Bucket"
        #     value = var.alb_access_log_s3_bucket
        # }
        # setting {
        #     namespace = "aws:elbv2:loadbalancer"
        #     name = "AccessLogsS3Enabled"
        #     value = var.alb_access_log_s3_enabled
        # }
        # setting {
        #     namespace = "aws:elbv2:loadbalancer"
        #     name = "AccessLogsS3Prefix"
        #     value = var.alb_access_log_s3_prefix
        # }
        setting {
            namespace = "aws:elbv2:loadbalancer"
            name = "IdleTimeout"
            value = var.alb_timeout
        }


    
#5. Rolling updates and deployment
    #Application deployments
        setting {
            namespace = "aws:elasticbeanstalk:command"
            name = "DeploymentPolicy"
            value = var.deployment_policy
        }
        setting {
            namespace = "aws:elasticbeanstalk:command"
            name = "BatchSize"
            value = var.deployment_batch_size
        }
        setting {
            namespace = "aws:elasticbeanstalk:command"
            name = "BatchSizeType"
            value = var.deployment_batch_size_type
        }
       
        
    #configuration update
        setting {
            namespace = "aws:autoscaling:updatepolicy:rollingupdate"
            name = "RollingUpdateEnabled"
            value = var.rolling_update_enabled
        }
        setting {
            namespace = "aws:autoscaling:updatepolicy:rollingupdate"
            name = "RollingUpdateType"
            value = var.rolling_update_type
        }
        setting {
            namespace = "aws:autoscaling:updatepolicy:rollingupdate"
            name = "MaxBatchSize"
            value = var.max_batchsize
        }
        setting {
            namespace = "aws:autoscaling:updatepolicy:rollingupdate"
            name = "MinInstancesInService"
            value = var.min_batchsize
        }
         setting {
            namespace = "aws:autoscaling:updatepolicy:rollingupdate"
            name = "PauseTime"
            value = var.pause_time
        }
    # Deployment preferences
        setting {
                namespace = "aws:elasticbeanstalk:command"
                name = "IgnoreHealthCheck"
                value = var.deployment_ignore_health_check
            }
        setting {
                namespace = "aws:elasticbeanstalk:environment:process:default"
                name = "UnhealthyThresholdCount"
                value = var.deployment_health_threshold
            }     
        setting {
            namespace = "aws:elasticbeanstalk:command"
            name = "Timeout"
            value = var.deployment_timeout
        }  


#6. Security
        setting {
             namespace = "aws:elasticbeanstalk:environment"
             name = "ServiceRole"
             value = var.service_profile_role
         } 
        setting {
            namespace = "aws:autoscaling:launchconfiguration"
            name = "EC2KeyName"
            value = var.ssh_key_name
        }
         setting {
            namespace = "aws:autoscaling:launchconfiguration"
            name = "IamInstanceProfile"
            value = var.instance_profile_role
        }
        
#7 . Monitoring
        setting {
            namespace = "aws:elasticbeanstalk:healthreporting:system"
            name = "SystemType"
            value = var.healthcheck_type
        } 
        setting {
            namespace = "aws:elasticbeanstalk:healthreporting:system"
            name = "ConfigDocument"
            value = var.config_document
        } 
        
        setting {
            namespace = "aws:elasticbeanstalk:healthreporting:system"
            name = "HealthCheckSuccessThreshold"
            value = var.healthCheck_success_threshold
        } 
# 8. Managed updates 
# 9. Notifications
    #Email notifications
        setting {
            namespace = "aws:elasticbeanstalk:sns:topics"
            name = "Notification Endpoint"
            value = var.notification_endpoint
        } 
         setting {
            namespace = "aws:elasticbeanstalk:sns:topics"
            name = "Notification Protocol"
            value = var.notification_protocol
        } 
        #  setting {
        #     namespace = "aws:elasticbeanstalk:sns:topics"
        #     name = "Notification Topic ARN"
        #     value = var.notification_topic_arn
        # } 
        # setting {
        #     namespace = "aws:elasticbeanstalk:sns:topics"
        #     name = "Notification Topic Name"
        #     value = var.notification_topic_name
        # } 

# 10. network settings include VPC, subnets for instances and ELB/ALB
    # 
    #   VPC setting
        setting {
        namespace = "aws:ec2:vpc"
        name = "VPCId"
        value = var.vpc_id
        }
    #  Load balancer visibility setting
        setting {
            namespace = "aws:ec2:vpc"
            name = "ELBScheme"
            value = "public"
        }     
    #   ELB/ALB subnet setting 
        setting {
        namespace = "aws:ec2:vpc"
        name = "ELBSubnets"
        value = var.eb-public-alb-subnet-3
        }        

    #   Instance settings
        setting {
        namespace = "aws:ec2:vpc"
        name = "AssociatePublicIpAddress"
        value = var.public_ip       
        }   

    #   Instance subnet settings
        setting {
        namespace = "aws:ec2:vpc"
        name = "Subnets"
        value = var.eb-alb-subnet-1
        }
           
        
}
