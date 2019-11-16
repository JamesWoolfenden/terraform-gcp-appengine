#Makefile
ifdef OS
   RM = $(powershell  –noprofile rm .\terraform\modules -force -recurse)
else
   ifeq ($(shell uname), Linux)
      RM = rm .terraform/modules/ -fr
   endif
endif

.PHONY: all

all: init plan

init:
	$(RM)
	terraform init -reconfigure

plan: init
	terraform plan -refresh=true


build: init
	terraform apply -auto-approve#

lock:
	@$(TERRAFORM) apply -target module.statebucket.aws_dynamodb_table.dynamodb-state-lock -auto-approve


first: terraform/init lock
	@$(TERRAFORM) apply -target module.statebucket.google_storage_bucket.statebucket -auto-approve
	@$(TERRAFORM) apply -target module.statebucket.local_file.remote_state -auto-approve
	@$(TERRAFORM) init -force-copy
