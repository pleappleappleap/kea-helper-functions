/****************************************************************/
/* delete_dhcp6_server.sql					*/
/****************************************************************/
/* Copyright (c)2024 Sridhar Ayengar				*/
/****************************************************************/
/* https://github.com/pleappleappleap/kea-helper-functions	*/
/****************************************************************/


CREATE OR REPLACE PROCEDURE delete_dhcp6_server(tag varchar(64))
LANGUAGE plpgsql
AS $$
DECLARE rightnow timestamp with time zone;
BEGIN
  SELECT NOW() INTO rightnow;
  PERFORM createauditrevisiondhcp6(rightnow, tag, 'Removing server ' || tag, false);
  DELETE FROM dhcp6_server WHERE dhcp6_server.tag = delete_dhcp6_server.tag;
END $$;
