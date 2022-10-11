
view: producto {

  sql_table_name: `looker_academy.Producto`
    ;;


  dimension: categoria {
    label: "Categoria"
    type: string
    sql: ${TABLE}.Categoria ;;
  }

  dimension: id_producto {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.ID_producto ;;
  }

  dimension: nombre_producto {
    label: "Nombre"
    type: string
    sql: ${TABLE}.Nombre_producto ;;
  }

  dimension: subcategoria {
    label: "Sub-categoria"
    type: string
    sql: ${TABLE}.Subcategoria ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
