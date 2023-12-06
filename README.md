This is just a playground for Terraform. Nothing special.

# Notes
- PubIP, LB, VM SKUs
-- SKUs need to match
-- PubIP needs to have a Static allocation
-- Standard SKUs for LB and VMs
- NSG
-- Associate NSG with pool members' IPs
-- That is, associate a rule ("allow HTTP inbound") with the member directly