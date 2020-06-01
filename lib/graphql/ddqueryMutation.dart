
 

final String getTasksQuery = """
query {
  roles {
    id,
    name, 
  }
}
""";

final String createTaskMutation = """
mutation CreateRole(\$name: String!) {
  createRole(name: \$name) {
    id
  }
}
""";

final String updateTaskMutation = """
mutation UpdateRole(\$id: ID!, \$completed: Boolean!) {
  updateRole(id: \$id, completed: \$completed) {
    id
  }
}
""";