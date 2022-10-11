
view: vendedores {

  sql_table_name: `looker_academy.Vendedores`
    ;;

  dimension: region {
    primary_key: yes
    label: "Región"
    type: string
    sql: ${TABLE}.Region ;;
  }

  dimension: vendedor {
    label: "Vendedor"
    primary_key: yes
    type: string
    sql: ${TABLE}.Vendedor ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
