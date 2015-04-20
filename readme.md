# AWS information script

This script is to monitor all the information in AWS in EC2, RDS, ELB, Elasticache and CloudFormation

  * In EC2 it describes all instances and thier information
  * In RDS it shows all running Databases
  * It shows all active Elastic Load Balancers
  * It shows all active Elasticache memcached instances
  * It shows all active Stacks in Cloudformation

---

### aws_info.sh - Generates json containing aws information

This program runs in two scripts. The first one is a shell script that queries AWS using the [AWS CLI interface](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html). You need to install the AWS CLI software folloing the itstructions in that link. It also requires the proper IAM configuration to be set. This was the policy set in IAM, and although the permisions are very broad, it is only for demostration purposes:

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Stmt1429508992000",
            "Effect": "Allow",
            "Action": [
                "ec2:*"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "Stmt1429509020000",
            "Effect": "Allow",
            "Action": [
                "rds:*"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "Stmt1429509057000",
            "Effect": "Allow",
            "Action": [
                "elasticache:*"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "Stmt1429509066000",
            "Effect": "Allow",
            "Action": [
                "cloudformation:*"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "Stmt1429509067000",
            "Effect": "Allow",
            "Action": [
                "elasticloadbalancing:*"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
}
```

Once that is setup, and the proper AWS Keys and AWS secret is in place, the aws_info.sh will generate JSON containing all the AWS requested information. It is executed by running `./aws_info.sh`. 

A sample output was included in **aws_info.json.sample**.

### generate_html - Python script that generates HTML using the JSON generated by aws_info.sh

The second part of this program is the **generate_html.sh** script. This is a script generated in Python that calls the **aws_info.sh** and uses the generated JSON to create a more human readable version in HTML. This uses the python library [json2html](https://github.com/softvar/json2html). This needs to be downloaded, uncompressed and installed by going into the extracted json2html-0.3 directory and running `python setup.py install`. It was tested using Python 2.7.5

Once those prerequisites are met it can be run by executing `./generate_html.sh` and it will generate an **index.html** file

This file can be viewed in a web browser or can be added to a web server for remote viewing.

Sample files were also included named **index.html.sample** and **index.html.sample2**.

---