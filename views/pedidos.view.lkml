
view: pedidos {

  sql_table_name: `looker_academy.Pedidos`
    ;;



  dimension: beneficio {
    label: "Ganancia"
    type: number
    sql: ${TABLE}.Beneficio ;;
  }

  measure: total_beneficio {
    label: " Ganancia total"
    type: sum
    sql: ${beneficio} ;;
    value_format_name: usd
  }

  measure: average_beneficio {
    label: "Ganancia promedio"
    type: average
    sql: ${beneficio}
    ;;
    value_format_name: usd
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
    value_format_name: usd
  }

  dimension: descuento {
    hidden:  yes
    type: number
    sql: ${TABLE}.Descuento ;;
    value_format_name: usd
  }

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
    primary_key: yes
    type: string
    sql: ${TABLE}.ID_cliente ;;
  }

  dimension: id_fila {
    hidden:  yes
    type: number
    sql: ${TABLE}.ID_fila ;;
  }

  dimension: id_mercado {
    primary_key: yes
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
    primary_key: yes
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
    label: "Ventas"
    type: number
    sql: ${TABLE}.Ventas ;;
    value_format_name: usd
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
