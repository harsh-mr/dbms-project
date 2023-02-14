

-- Host: localhost:3306


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom-react`
--

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE `orderitems` (
  `id` int(5) NOT NULL,
  `orderid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `productqty` int(5) NOT NULL,
  `productprice` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderitems`
--

INSERT INTO `orderitems` (`id`, `orderid`, `productid`, `productqty`, `productprice`, `date`) VALUES
(1, 2, 2, 1, 200, '2021-07-26 20:09:50'),
(2, 2, 6, 1, 250, '2021-07-26 20:09:50'),
(3, 2, 5, 1, 150, '2021-07-26 20:09:50');

-- --------------------------------------------------------
use ecom;
select * from users;

select * from products where id = (select o.productid from orderitems as o ,orders as e where o.orderid=e.id and e.userid =4 group by o.productid ORDER BY COUNT(o.productid) DESC LIMIT 1  );

select count(o.productid) from orderitems as o ,orders as e where o.orderid=e.id and e.userid =8 group by o.productid ORDER BY COUNT(o.productid) DESC LIMIT 1  ;


select o.productid,(count(distinct o.orderid)) from orderitems as o,orders as e where e.userid = 3 and e.id = o.orderid ;
select productid from orderitems as o where  (SELECT COUNT(DISTINCT o.orderid) FROM orderitems)   = (select MAX(COUNT(DISTINCT e.orderid)) from orderitems e where o.productid=e.productid );
--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(5) NOT NULL,
  `userid` int(5) NOT NULL,
  `totalprice` varchar(255) NOT NULL,
  `orderstatus` varchar(255) NOT NULL,
  `paymentmode` varchar(255) NOT NULL,
  `paymentid` varchar(255) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userid`, `totalprice`, `orderstatus`, `paymentmode`, `paymentid`, `timestamp`) VALUES
(2, 2, '650', 'order done', 'online', '9b48a1e628fd43f7b037d2634232613b', '2021-07-26 20:09:50');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(5) NOT NULL,
  `name` varchar(2000) NOT NULL,
  `price` int(11) NOT NULL,
  `plant_image` text NOT NULL,
  `status` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `plant_image`, `status`) VALUES
(1, 'tree1', 150, 'tree1.png', 1),
(2, 'tree2', 200, 'tree2.webp', 1),
(3, 'tree3', 100, 'tree3.webp', 1),
(4, 'tree4', 200, 'tree4.png', 1),
(5, 'tree5', 150, 'tree5.png', 1),
(6, 'tree6', 250, 'tree6.png', 1),
(7, 'tree7', 1000, 'tree7.png', 1);

INSERT INTO `products` (`id`, `name`, `price`, `plant_image`, `status`) VALUES
(14, 'Camera', 150, 'tree1.png', 1),
(8, 'Dwwatch', 200, 'tree2.webp', 1),
(9, 'Thwatch', 100, 'tree3.webp', 1),
(10, 'Specs', 200, 'tree4.png', 1),
(11, 'WrognShirt', 150, 'tree5.png', 1),
(12, 'HnMshirt', 250, 'tree6.png', 1),
(13, 'Shoe', 1000, 'tree7.png', 1);

select * from products;

DELETE FROM products WHERE id=14;

UPDATE products
SET name = 'Shoe'
WHERE id=7;


-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(5) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--




-- --------------------------------------------------------

--
-- Table structure for table `user_data`
--

CREATE TABLE `user_data` (
  `id` int(5) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_data`
--


select * from orders;
select * from orderitems;

-- select product from products p where p.id =  
--
-- Indexes for dumped tables
--

--
-- Indexes for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_data`
--
ALTER TABLE `user_data`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_data`
--
ALTER TABLE `user_data`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

use ecom;



select * from orders;
select * from orderitems;

select * from users;
select * from user_data;

drop trigger after_insert_users;

call getproducts();

Create Trigger after_insert_users  
AFTER INSERT
ON users FOR EACH ROW  
INSERT INTO `user_data` ( `name`, `email`,`user_id`) VALUES (new.username,new.email,new.id) ;

DELIMITER //
CREATE PROCEDURE getproducts ()
BEGIN
SELECT * FROM products;
END //
DELIMITER ;



DELIMITER //
CREATE PROCEDURE getproductbyid (IN id1 int(5))
BEGIN
select * from products where id=id1;
END //
DELIMITER ;



DELIMITER //
CREATE PROCEDURE getaddress(IN id1 int(5))
BEGIN
select * from user_data where user_id=id1;
END //
DELIMITER ;




call getproducts();
call getproductbyid(2);

select * from orderitems;
