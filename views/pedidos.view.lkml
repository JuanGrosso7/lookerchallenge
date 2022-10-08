# The name of this view in Looker is "Pedidos"
view: pedidos {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `looker_academy.Pedidos`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Beneficio" in Explore.

  dimension: beneficio {
    label: "Ganancia"
    type: number
    sql: ${TABLE}.Beneficio ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_beneficio {
    label: " Ganancia total"
    type: sum
    sql: ${beneficio} ;;
  }

  measure: average_beneficio {
    label: "Ganancia promedio"
    type: average
    sql: ${beneficio} ;;
  }

  dimension: cantidad {
    label: "Cantidad"
    type: number
    sql: ${TABLE}.Cantidad ;;
  }

  dimension: costo_envio {
    label: "Costo del envio"
    type: number
    sql: ${TABLE}.Costo_envio ;;
  }

  dimension: descuento {
    hidden:  yes
    type: number
    sql: ${TABLE}.Descuento ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: fecha_envio {
    label: "Fecha del envio"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Fecha_envio ;;
  }

  dimension_group: fecha_pedido {
    label: "Fecha del pedido"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Fecha_pedido ;;
  }

  dimension: id_cliente {
    hidden:  yes
    type: string
    sql: ${TABLE}.ID_cliente ;;
  }

  dimension: id_fila {
    hidden:  yes
    type: number
    sql: ${TABLE}.ID_fila ;;
  }

  dimension: id_mercado {
    hidden:  yes
    type: string
    sql: ${TABLE}.Id_Mercado ;;
  }

  dimension: id_pedido {
    hidden:  yes
    primary_key: yes
    type: string
    sql: ${TABLE}.ID_pedido ;;
  }

  dimension: id_producto {
    hidden:  yes
    type: string
    sql: ${TABLE}.ID_producto ;;
  }

  dimension: modo_envio {
    label: "Medio de envio"
    type: string
    sql: ${TABLE}.Modo_envio ;;
  }

  dimension: prioridad_pedido {
    label: "Prioridad del envio"
    type: string
    sql: ${TABLE}.Prioridad_pedido ;;
  }

  dimension: ventas {
    label: "Cantidad de ventas"
    type: number
    sql: ${TABLE}.Ventas ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
