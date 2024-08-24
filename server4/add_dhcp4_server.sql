/****************************************************************/
/* add_dhcp4_server.sql						*/
/****************************************************************/
/* Copyright (c)2024 Sridhar Ayengar				*/
/****************************************************************/
/* https://github.com/pleappleappleap/kea-helper-functions	*/
/****************************************************************/


CREATE OR REPLACE PROCEDURE add_dhcp4_server(tag varchar(64),
                                             description text)
LANGUAGE plpgsql
AS $$
DECLARE rightnow timestamp with time zone;
BEGIN
  SELECT NOW() INTO rightnow;
  PERFORM createauditrevisiondhcp4(rightnow, tag, 'Adding server ' || tag, false);
  INSERT INTO dhcp4_server(tag, description, modification_ts)
                    VALUES(tag, description, rightnow);
END $$;
