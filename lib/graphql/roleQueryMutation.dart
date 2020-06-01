final String getRoles = """
query {
  roles { 
    name, 
  }
}
""";

final String createRole = """
mutation CreateRole(\$name: String!) {
  createRole(name: \$name) {
    id
  }
}
""";

final String updateRole = """
mutation UpdateRole(\$id: ID!, \$completed: Boolean!) {
  updateRole(id: \$id, completed: \$completed) {
    id
  }
}
""";