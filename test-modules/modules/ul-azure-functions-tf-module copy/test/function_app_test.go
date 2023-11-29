package unit

import (
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformNetworkExample(t *testing.T) {
	t.Parallel() // Set tests to be run in parallel
	// Some vars to be used in the data injection and in the result matching
	// Construct the terraform options with default retryable errors to handle the most common
	// retryable errors in terraform testing.
	name := "functionapp-test-example"

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../example", // The path to where our Terraform code is located
		//variables to pass to terraform code using -var options
		Vars: map[string]interface{}{
			"function_app_name": name,
			// Currently all inputs have defaults, but here you can override  input variable values
		},
	})

	defer terraform.Destroy(t, terraformOptions) // Defer the destroy of resources after the tests complete

	terraform.InitAndApply(t, terraformOptions) // Run init & apply. Fail the test if there are any errors.

	// ------------------------ //
	// TESTING PARAMS
	//------------------------- //

	//fcnAppName := terraform.Output(t, terraformOptions, "function_app_name")
	//assert.Equal(t, fcnAppName, name)

	fcnAppName := terraform.Output(t, terraformOptions, "function_app_name")
	assert.True(t, strings.HasPrefix(fcnAppName, name))

	// createdSubnetList := terraform.OutputList(t, terraformOptions, "subnet_names")
	// assert.Len(t, createdSubnetList, 3)

	// expectedSubnetNames := []string{"subnet1", "subnet2", "subnet3"}
	// assert.Equal(t, expectedSubnetNames, createdSubnetList)

	// createdResourceGroup := terraform.Output(t, terraformOptions, "resource_group_name")
	// assert.True(t, strings.HasPrefix(createdResourceGroup, "testRG"))
}
