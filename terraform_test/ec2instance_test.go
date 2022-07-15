package test

import (
	"os"
	"testing"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestEc2Modules(t *testing.T) {
	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../terraform/modules/ec2",
		Vars: map[string]interface{}{
			"aws_access_key": os.Getenv("AWS_ACCESS_KEY"),
			"aws_secret_key": os.Getenv("AWS_SECRET_KEY"),
			"aws_region": os.Getenv("AWS_REGION"),
			"instance_type": os.Getenv("INSTANCE_TYPE"),
			"root_volume_size": os.Getenv("EBS_ROOT_VOLUME_SIZE"),
			"data_volume_size": os.Getenv("EBS_DATA_VOLUME_SIZE"),
			"key_name": os.Getenv("KEY_NAME"),
		},
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

}




