# aws_ebs

TODO: Enter the cookbook description here.

HOW-TO:

Create the following trust policy and save it in a text file named `ec2-role-trust-policy.json`.

    cat <<END >ec2-role-trust-policy.json
    {
      "Version": "2012-10-17",
      "Statement": [
      {
        "Effect": "Allow",
        "Principal": { "Service": "ec2.amazonaws.com"},
        "Action": "sts:AssumeRole"
      }
      ]
    }
    END


Create the s3access role. You'll specify the trust policy you created.

    aws iam create-role --role-name volumeRole --assume-role-policy-document file://ec2-role-trust-policy.json

    { {snip... }}



Create an access policy and save it in a text file named volume_policy.json:

    cat << END > volume_policy.json
    {
      "Version": "2012-10-17",
      "Statement": [
      {
        "Action": [
        "ec2:AttachVolume",
        "ec2:CreateVolume",
        "ec2:ModifyVolumeAttribute",
        "ec2:DescribeVolumeAttribute",
        "ec2:DescribeVolumeStatus",
        "ec2:DescribeVolumes",
        "ec2:DetachVolume",
        "ec2:EnableVolumeIO"
        ],
        "Resource": [
        "*"
        ],
        "Effect": "Allow"
      }
      ]
    }
    END

Implement:

    aws iam put-role-policy --role-name volumeRole --policy-name  volumePolicy --policy-document file://volume_policy.json

Create an instance profile named volumeProfile.

    aws iam create-instance-profile --instance-profile-name volumeProfile

Add the volumeRole role to the volumeProfile instance profile.

    aws iam add-role-to-instance-profile --instance-profile-name volumeProfile --role-name volumeRole

Set default profile

    export AWS_PROFILE=volumeProfile

Now run `chef-client`


    chef-client -c .chef/client.rb -r aws_ebs -z


CLEANUP:

    chef-client -c .chef/cliene.rb -r aws_ebs::destroy -z
    knife node delete aws_ebs -c .chef/client.rb -z
