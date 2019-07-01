#tfs specific policies
# #Render the boudnary Policy from the template
# data "template_file" "boundary_policy_doc" {
#   template = "${file("${path.module}/policy-templates/tfs_boundary_policy.json")}"
#   vars = {
#     acct_num = "${data.aws_caller_identity.current.account_id}"
#   }
# }
# resource "aws_iam_policy" "boundary_policy" {
#   name        = "tfs_boundary"
#   path        = "/"
#   description = "TFS Boundary Policy"
#   policy      = "${data.template_file.boundary_policy_doc.rendered}"
# }

