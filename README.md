# terraform-scripts

Terraform is also known as Innfrastructure as Code (IaC).
It is used for Auto Provisioning and Procurement.
Its owned by Hashicorp, It also owns tools like vault, packer, vagrant.
Launched in 2014 as OSS.
There are two types versions of terraform available, OSS and Enterprise
Its available as 2 types to use, OnPrem and SaaS(Cloud).

Its written in HCL (HashiCorp Configuration Language).

Terraform is cloud Agnostic and can be used on any cloud provider. Cloud Provider specific tools are 

* CloudFormation (AWS)
* Azure Resource Manager Template (ARM)
* Deployment Manager (GCP)

This is Easy to use and Manage.
This is Descriptive Scripting Language (DSL) ment it doesnt have more code logic to write and just small parameters to add.
In build Dependency Resolving Capability - sets its own order to run the things.
Automate other platforms like k8s, rancher, github, gitlab, postgress, splunk, cisco.

This is very easy to learn as it has only 8 components to learn and understand.

1. provider - which platform to automate like AWS, Azure, GCP, k8s, mysql.
2. Resources - E2C, EFS, Security Groups.
3. Data Sources - security, VPC.
4. Variables - To make code generic and reusable.
5. Outputs - to display the output on screen for usage like credentials, db details, etc.
6. Provisioners - to perform certain tasks on procured infra once they are ready to use.
7. Modules - Easy to call the part of code in their code.
8. .tf (terraformfile) - file extension for file.

Other Capabilities:

* workspace - work on different provisions at a time managing in different workspaces.
* backend - stores the state in remote location as tf state.
* lock - locking the state file when something is running.

URL: https://www.terraform.io/

## Installation of Terraform CLI
Download CLI: https://www.terraform.io/downloads.html

### MAC

**OPT 1**: Export the path of installed tool.

    export PATH=$PATH:/usr/local/terraform/

**OPT 2**: Just copy your terraform binary and place it in /usr/local/bin/

    sudo mv terraform /usr/local/bin

verify your installation and check the version, launch Windows PowerShell and enter: *terraform -version*

### Windows

1. Download the applicable package to your local system.
2. Extract the package to the folder C:\Program Files (x86).
   This path is used as an example. However, you can also the Terraform executable to any other location in your local system.
3. Update the path environment variable to include the folder where your Terraform.executable is located.
   1. Go to the **Control Panel**.
   2. Click **System**.
   3. On a Windows 10 system, click **Advanced system settings**. This option might vary in different versions of Windows. The Advanced tab of the System Properties window is displayed.
   4. Click **Environment Variables** near the bottom of the window. The Environment Variables window is displayed.
   5. In the System variables pane, click **Path** and then click **Edit**.
   6. Click **New**. Add the path to the folder where your Terraform executable is located.
   7. Click **OK** to save your changes and then click **OK** to exit the Environment Variables windows. Then click **OK** again to exit the System Properties window.
   8. To verify your installation and check the version, launch Windows PowerShell and enter: *terraform -version*
Add path of terraform where its installed in PATH variable.

## Working with Terraform

Below steps run in folder *terraform-demo*.

1. Create **main.tf** file.
2. We use *AWS* and work in region *us-east-2*. It can be any region but for practice using this region.
3. Provide the values for the **AWS_ACCESS_KEY_ID** and **AWS_SECRET_ACCESS_KEY** and export it. For Windows add these variables in User Variables section of **Environment Variables** in **Advanced system settings**.

        export AWS_ACCESS_KEY_ID="anaccesskey"
        export AWS_SECRET_ACCESS_KEY="asecretkey"

4. Run the commmand *terraform init*, It will download the provider plugin locally with **.terraform** folder

    >We have installed terraform cli on local machine, created a terraform project. On running **terraform init** command, terraform cli on local will connect to terraform registry to download the plugin needed to install for connecting remote aws cloud. This will create *.terraform* folder with all plugins on local.
    >For accessing the details of provider access the URL https://registry.terraform.io/ and click on **Browse Registry** to access all supported  providers or use https://registry.terraform.io/browse/providers.

## Working with Variables

Below steps run in folder *terraform-demo*.

1. Create a file **variables.tf**.
2. Write code for the values you want to parameterize.
3. Use this variable in the place where its value need to be used in the following format.

        var.<variable-name>

4. You can give variable without value, whose value need to be given at run time, predefine the values of the variable in the file, Provide the value parameterized.

        terraform apply -var variable=value

## working with Modules

Below steps run in folder *terraform-modules-demo*.

1. Create a folder **modules**.
2. Create a folder with the name of module under **modules** and create four files under it.
   1. **variables.tf** - To write variables that we use in terraform files.
   2. **main.tf** - Write actual code logic.
   3. **output.tf** - Write the outputs needed for reference and usage.
   4. **versions.tf** - Required version of terraform to use this module.
3. Write your respective set of codes in thoose file and come back to **terraform-modules-demo** folder.
4. Create a file **main.tf** where we define the provider and call the modules that are needed to run.

## Terraform commands

* **terraform init** - Initialize terraform, download the plugins needed.
* **terraform validate** - Validate the terraform script for errors.
* **terraform plan** - Will do a dry-run and tell whats going to execute.
* **terraform apply** - Will apply al the terraform changes.
  * *-auto-approve* - Pass this parameter to the apply command for auto approval if you feel everything is correct.

        terraform apply -auto-approve

  * *-target module.\<module-name>* - to run a specific module.
  
        terraform apply -target module.<module-name>

* **terraform state list** - will tell what all changes done.
* **terraform output** - will show the details that are needed for handy to get printed in output.
* **terraform destroy** - Will delete everything thats created.