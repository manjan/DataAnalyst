CREATE TABLE orders_avro (
   order_id INT,
   cust_id INT,
   order_date STRING)
  STORED AS AVRO
  TBLPROPERTIES (
      'avro.schema.literal'=
      '{
        "name": "order",
        "type": "record",
        "fields": [
            {"name":"order_id", "type":"int"},
            {"name":"cust_id", "type":"int"},
            {"name":"order_date", "type":"string"}
        ]}'
 );
