CREATE OR REPLACE PROCEDURE add_dhcp6_server(tag varchar(64),
                                             description text)
LANGUAGE plpgsql
AS $$
DECLARE rightnow timestamp with time zone;
BEGIN
  SELECT NOW() INTO rightnow;
  PERFORM createauditrevisiondhcp6(rightnow, tag, 'Adding server ' || tag, false);
  INSERT INTO dhcp6_server(tag, description, modification_ts)
                    VALUES(tag, description, rightnow);
END $$;
