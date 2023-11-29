# locals {
#   operations_flattened = flatten([
#     for api_key, api in var.apis : [
#       for operation_key, operation in api.operations : {
#         api_key                = api_key
#         api_name               = api.api_name
#         operation_name         = operation.operation_name
#         operation_display_name = operation.operation_display_name
#         method                 = operation.method
#         url_template           = operation.url_template
#         description            = operation.description
#       }
#     ]
#   ])
#   operations_flattened_to_map = {
#     for operation in local.operations_flattened : "${operation.api_key}.${operation.operation_name}" => operation
#   }
# }
