CREATE OR REPLACE PROCEDURE add_dhcp4_server(tag varchar(64),
                                             description text)
LANGUAGE plpgsql
AS $$
DECLARE rightnow timestamp;
BEGIN
  BEGIN TRANSACTION;
  SELECT NOW() INTO rightnow;
  CALL createauditrevisiondhcp4(rightnow, tag, 'Adding server ' || tag, 0);
  INSERT INTO dhcp4_server(tag, description, modification_ts)
                    VALUES(tag, description, rightnow);
  COMMIT;
END $$;
