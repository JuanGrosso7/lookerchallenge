# The name of this view in Looker is "Mercado"
view: mercado {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `looker_academy.Mercado`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Ciudad" in Explore.

  dimension: ciudad {
    label: "Ciudad"
    type: string
    sql: ${TABLE}.Ciudad ;;
  }

  dimension: estado {
    label: "Estado"
    type: string
    sql: ${TABLE}.Estado ;;
  }

  dimension: id_mercado {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.Id_Mercado ;;
  }

  dimension: mercado {
    label: "Mercado"
    type: string
    sql: ${TABLE}.Mercado ;;
  }

  dimension: pais {
    label: "País"
    type: string
    sql: ${TABLE}.Pais ;;
  }

  dimension: region {
    label: "Región"
    primary_key: yes
    type: string
    sql: ${TABLE}.Region ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
