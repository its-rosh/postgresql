DROP TABLE IF EXISTS basics.app_events;

CREATE TABLE basics.app_events(

    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
        -- UUID - unique user id .. different for all ... given by com only 

    event_name TEXT NOT NULL,

    metadata JSONB DEFAULT '{}' :: jsonb,
    -- we are storing mata data in jsonb format 

    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO basics.app_events(event_name,metadata)
VALUES 
(
    'sign_up',
    '{"browser": "chrom"}'
),
(
    'sign_in',
    '{"user": "roshita"}'
);

SELECT * FROM basics.app_events;

SELECT 
    event_name, -- we have selected event name from the table basics.app_events whic we created above in schema basics 
    metadata ->> 'browser' AS browser -- from that we are searchn=ing for meta data where browser is and git it us as text 
FROM basics.app_events  -- from where are we selecting event_name 
WHERE   metadata ? 'browser';  -- where meta data is browser inn text fromat 
