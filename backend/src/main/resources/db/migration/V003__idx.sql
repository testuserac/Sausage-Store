CREATE INDEX idx_o_or_id ON order_product(order_id);
CREATE INDEX idx_o_pr_id ON order_product(product_id);
CREATE INDEX idx_stat ON orders(status);
CREATE INDEX idx_or_id ON orders(id);
CREATE INDEX idx_or_name ON product(name);
