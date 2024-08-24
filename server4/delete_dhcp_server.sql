CREATE OR REPLACE PROCEDURE add_dhcp4_server(tag varchar(64),
                                             description text)
LANGUAGE plpgsql
AS $$
DECLARE rightnow timestamp with time zone;
BEGIN
  SELECT NOW() INTO rightnow;
  PERFORM createauditrevisiondhcp4(rightnow, tag, 'Removing server ' || tag, false);
  DELETE FROM dhcp4_server WHERE tag = tag;
END $$;
