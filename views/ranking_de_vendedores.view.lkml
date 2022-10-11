view: ranking_de_vendedores {
  derived_table: {
    sql: SELECT
          vendedores_vendedor as Vendedor,
          vendedores_count as Ventas
      FROM
          (SELECT
                  vendedores.Vendedor  AS vendedores_vendedor,
                  COUNT(*) AS vendedores_count,
                  COUNT(*) AS vendedores_count_0
              FROM `looker_academy.Pedidos`
           AS pedidos
      LEFT JOIN `looker_academy.Devoluciones`
           AS devoluciones ON pedidos.ID_pedido = devoluciones.ID_pedido
      LEFT JOIN `looker_academy.Vendedores`
           AS vendedores ON devoluciones.Region = vendedores.Region
              WHERE ((( pedidos.Fecha_pedido  ) >= (DATE('2012-01-01')) AND ( pedidos.Fecha_pedido  ) < (DATE('2015-12-31'))))
              GROUP BY
                  1
              HAVING vendedores_count_0 < 40000) AS t3
      ORDER BY
          2 DESC
      LIMIT 500
       ;;

  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: vendedor {
    primary_key: yes
    type: string
    sql: ${TABLE}.Vendedor ;;
  }

  dimension: ventas {
    type: number
    sql: ${TABLE}.Ventas ;;
  }

  set: detail {
    fields: [vendedor, ventas]
  }
}
