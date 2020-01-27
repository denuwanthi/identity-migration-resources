CREATE TABLE IDN_AUTH_SESSION_STORE
(
    SESSION_ID     VARCHAR(100) NOT NULL,
    SESSION_TYPE   VARCHAR(100) NOT NULL,
    SESSION_OBJECT BLOB,
    TIME_CREATED   TIMESTAMP,
    PRIMARY KEY (SESSION_ID, SESSION_TYPE)
) ENGINE NDB;

UPDATE IDP_AUTHENTICATOR
SET NAME='samlsso'
WHERE NAME = 'saml2sso'
  AND TENANT_ID = '-1234';

ALTER TABLE IDP_PROVISIONING_ENTITY
    DROP INDEX ENTITY_TYPE;

ALTER TABLE IDP_PROVISIONING_ENTITY
    ADD UNIQUE KEY ENTITY_TYPE (ENTITY_TYPE, TENANT_ID, ENTITY_LOCAL_USERSTORE, ENTITY_NAME, PROVISIONING_CONFIG_ID);