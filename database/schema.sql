-- Workflows table (main data)
CREATE TABLE workflows (
    id SERIAL PRIMARY KEY,
    workflow_id VARCHAR(100) NOT NULL UNIQUE,  -- From external API
    display_name VARCHAR(255) NOT NULL,
    scheduled_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- pending, approved, rejected, in_progress
    who_was_in_shift VARCHAR(100) NOT NULL,
    helix_status VARCHAR(255),
    helix_status VARCHAR(255),
    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    was_l2_contacted VARCHAR(255),
    why_not VARCHAR(255),
    zendesk_ticket VARCHAR(255),
    comment VARCHAR(255),
    email VARCHAR(255),
    notes TEXT
);

-- Statuses lookup table (optional, for consistency)
CREATE TABLE statuses (
    id SERIAL PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT
);

-- Insert default statuses
INSERT INTO statuses (status_name, description) VALUES
    ('pending', 'Awaiting review'),
    ('approved', 'Approved for processing'),
    ('rejected', 'Rejected'),
    ('in_progress', 'Currently being processed'),
    ('completed', 'Finished');

-- Indexes for performance
CREATE INDEX idx_workflows_status ON workflows(status);
CREATE INDEX idx_workflows_submitted_at ON workflows(submitted_at);
CREATE INDEX idx_workflows_agent ON workflows(agent_email);
