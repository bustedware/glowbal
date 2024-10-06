# About

Glowbal (https://www.glowbal.earth) is a website that allows users to interact with a 3D Earth. Each Glow solar farm is plotted at its latitude/longitude and you can hover over each farm to get its high level stats

# Requirements

1. Registered domain name for API gateway
2. Terraform v1.2.3 for building and deploying infrastructure in AWS
3. MongoDB Atlas database server for hosting each weeks data from Glow weekly reports

# Deploy steps

1. create `terraform.tfvars` and add values for:
    - access_key
    - secret_key
    - mdbserver
    - domain_name

2. cd iac

3. terraform init

4. terraform apply


#### Infrastructure deployed

1. Lambda function
    - templated index.html
    - python script
    - glow weekly report summarys for caching and reducing database lookups

2. API gateway

3. ACM for hosting API gateway Lambda integration over https

4. Registered DNS domain

5. MongoDB Atlas