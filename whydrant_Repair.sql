CREATE TRIGGER RPUD.wHydrant_Repair AFTER UPDATE
ON RPUD.A7301
FOR EACH ROW
BEGIN
  IF :new.REPAIRNEED <> :old.REPAIRNEED THEN
    INSERT INTO RPUD.HYDRANTEVENTS (FACILITYID,REPAIRNEED,FLOWED,CHECKED,OPERABLE,NOTES,REPAIRDATE)
      VALUES (:new.FACILITYID, :new.REPAIRNEED, :new.FLOWED, :new.CHECKED, :new.OPERABLE, :new.NOTES, :new.REPAIRDATE);
  END IF;
END;
