
connection: "looker-challenge"


include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: juan_grosso_looker_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: juan_grosso_looker_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Juan Grosso Looker"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.



explore: pedidos {

  join: devoluciones {
    type: left_outer
    sql_on: ${pedidos.id_pedido} = ${devoluciones.id_pedido};;
relationship: one_to_one
  }
  join: producto {
    type: left_outer
    sql_on: ${pedidos.id_producto} = ${producto.id_producto} ;;
relationship: many_to_one
  }
  join: cliente {
    type: left_outer
    sql_on: ${pedidos.id_cliente} = ${cliente.id_cliente} ;;
relationship: many_to_one
  }
  join: vendedores {
    type: left_outer
    sql_on: ${devoluciones.region} = ${vendedores.region} ;;
    relationship: one_to_one
  }
  join: mercado {
    type: left_outer
    sql_on: ${pedidos.id_mercado} = ${mercado.id_mercado} ;;
    relationship: one_to_one
  }

}
