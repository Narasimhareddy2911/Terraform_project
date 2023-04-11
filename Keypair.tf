# key pair after generating using ssh-keygen and providing the public key. 
resource "aws_key_pair" "card-app-key-pair" {
  key_name   = "card-app-key-pair"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC38CFbc8Qcd2sHdH0KwE+T/NURDtXLU3k9qWVwTKWF9k9cM4b5HDs+q9kQ1QzZsNC8bZZKePa/R/LS0km5xdJ8Y8iQ7vRwGKELN4H/v4Ld/v7DCEVJEmECvxOl3yZyL0F7lSc6JMNsx4An+c3SbHG8S3D0yHbKRofmDnmloGlbG+HWCc8vESve5lPoBOSdXdaLrgOGHZ50fhEIKb2MQtFbHy/FlOM5jo6IfawvELn5NqNXAewNVtr/ouZl5fywIs9aF6zenZFt3+22cUXZgaajrY2itcMb6BhrialYe6wR6FdLepCmp1OO0omsKwvCoTM5OROJFDzkcAnK0fFljCocV18TTwYX07CFyIjYUJdpvsvu1DiOCZBgY96w1RJtmOVRLMsoBICDh1DXxU2iczX+IGMOi3Pld7rcgSUD1tgZwIPIg8urC0/LDUnpG1DpJYtP/s9srYUDIRP5HvytY/z+0P4I01gi25xIn32GmY+ZUE0DkoVyNyy9XKXWZ2qCfo0= lakshminarasimharedd@GLNREDDY"
}
