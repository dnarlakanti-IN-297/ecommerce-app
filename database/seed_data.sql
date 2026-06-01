-- Seed data for E-Commerce application

-- Insert default user
INSERT INTO users (email, password_hash, name) VALUES
('demo@example.com', 'hashed_password_here', 'Demo User');

-- Insert sample products
INSERT INTO products (name, description, price, category, stock, image_url, rating) VALUES
('Wireless Headphones', 'Premium noise-cancelling wireless headphones with 30-hour battery life', 199.99, 'electronics', 50, 'https://via.placeholder.com/300x200?text=Headphones', 4.5),
('Smart Watch', 'Fitness tracker with heart rate monitor and GPS', 299.99, 'electronics', 30, 'https://via.placeholder.com/300x200?text=Smart+Watch', 4.7),
('Laptop Backpack', 'Durable laptop backpack with USB charging port', 49.99, 'electronics', 100, 'https://via.placeholder.com/300x200?text=Backpack', 4.3),
('Running Shoes', 'Lightweight running shoes with cushioned sole', 89.99, 'sports', 75, 'https://via.placeholder.com/300x200?text=Running+Shoes', 4.6),
('Yoga Mat', 'Non-slip yoga mat with carrying strap', 29.99, 'sports', 120, 'https://via.placeholder.com/300x200?text=Yoga+Mat', 4.4),
('Dumbbell Set', 'Adjustable dumbbell set 5-50 lbs', 199.99, 'sports', 25, 'https://via.placeholder.com/300x200?text=Dumbbells', 4.8),
('Cotton T-Shirt', 'Premium cotton t-shirt in multiple colors', 24.99, 'clothing', 200, 'https://via.placeholder.com/300x200?text=T-Shirt', 4.2),
('Denim Jeans', 'Classic fit denim jeans', 59.99, 'clothing', 80, 'https://via.placeholder.com/300x200?text=Jeans', 4.5),
('Winter Jacket', 'Waterproof winter jacket with hood', 129.99, 'clothing', 40, 'https://via.placeholder.com/300x200?text=Jacket', 4.7),
('Sneakers', 'Casual sneakers for everyday wear', 79.99, 'clothing', 60, 'https://via.placeholder.com/300x200?text=Sneakers', 4.4),
('Python Programming', 'Complete guide to Python programming', 39.99, 'books', 150, 'https://via.placeholder.com/300x200?text=Python+Book', 4.9),
('Web Development', 'Modern web development with React and Node.js', 44.99, 'books', 100, 'https://via.placeholder.com/300x200?text=Web+Dev+Book', 4.6),
('Machine Learning', 'Introduction to Machine Learning algorithms', 49.99, 'books', 80, 'https://via.placeholder.com/300x200?text=ML+Book', 4.8),
('Digital Camera', '24MP digital camera with 4K video', 599.99, 'electronics', 20, 'https://via.placeholder.com/300x200?text=Camera', 4.7),
('Bluetooth Speaker', 'Portable waterproof Bluetooth speaker', 79.99, 'electronics', 90, 'https://via.placeholder.com/300x200?text=Speaker', 4.5),
('Gaming Mouse', 'RGB gaming mouse with programmable buttons', 49.99, 'electronics', 70, 'https://via.placeholder.com/300x200?text=Gaming+Mouse', 4.6),
('Mechanical Keyboard', 'RGB mechanical keyboard with blue switches', 99.99, 'electronics', 45, 'https://via.placeholder.com/300x200?text=Keyboard', 4.8),
('Tennis Racket', 'Professional tennis racket with carry case', 149.99, 'sports', 35, 'https://via.placeholder.com/300x200?text=Tennis+Racket', 4.7),
('Basketball', 'Official size basketball for indoor/outdoor', 39.99, 'sports', 100, 'https://via.placeholder.com/300x200?text=Basketball', 4.5),
('Hoodie', 'Comfortable cotton blend hoodie', 44.99, 'clothing', 90, 'https://via.placeholder.com/300x200?text=Hoodie', 4.6);
