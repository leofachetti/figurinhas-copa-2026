-- Executar TUDO de uma vez no SQL Editor do Supabase
-- ATENÇÃO: vai apagar os dados atuais!

DROP TABLE IF EXISTS album_state;

CREATE TABLE album_state (
  id INTEGER PRIMARY KEY DEFAULT 1 CHECK (id = 1),
  state JSONB NOT NULL DEFAULT '{}',
  visitor_state JSONB NOT NULL DEFAULT '{}',
  pin_hash TEXT NOT NULL DEFAULT '',
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE album_state ENABLE ROW LEVEL SECURITY;

CREATE POLICY "public_select" ON album_state FOR SELECT USING (true);
CREATE POLICY "public_insert" ON album_state FOR INSERT WITH CHECK (true);
CREATE POLICY "public_update" ON album_state FOR UPDATE USING (true) WITH CHECK (true);

GRANT SELECT, INSERT, UPDATE ON album_state TO anon, authenticated;
