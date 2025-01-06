-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 06, 2025 at 12:51 PM
-- Server version: 8.0.39-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `atten_sys`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminCred`
--

CREATE TABLE `adminCred` (
  `id` varchar(16) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `adminCred`
--

INSERT INTO `adminCred` (`id`, `password`, `name`) VALUES
('admin', '$2a$12$GItZp0K210risZyDfRuYVO1DOxYRIhpRN6QM7RY29RA8qsd2xNyXu', 'Harish');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `attendance_id` int NOT NULL,
  `hour` int NOT NULL,
  `day_order` char(1) NOT NULL,
  `date` date NOT NULL,
  `student_id` varchar(16) DEFAULT NULL,
  `attendance_status` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`attendance_id`, `hour`, `day_order`, `date`, `student_id`, `attendance_status`) VALUES
(1, 2, 'C', '2024-12-28', '22UCS620', 'A'),
(2, 2, 'C', '2024-12-28', '22UCS621', 'A'),
(3, 2, 'C', '2024-12-28', '22UCS624', 'A'),
(4, 2, 'C', '2024-12-28', '22UCS627', 'A'),
(5, 2, 'C', '2024-12-28', '22UCS622', 'A'),
(6, 2, 'C', '2024-12-28', '22UCS626', 'P'),
(7, 2, 'C', '2024-12-28', '22UCS628', 'A'),
(8, 1, 'C', '2024-12-28', '22UCS620', 'A'),
(9, 1, 'C', '2024-12-28', '22UCS621', 'P'),
(10, 1, 'C', '2024-12-28', '22UCS622', 'P'),
(11, 1, 'C', '2024-12-28', '22UCS626', 'P'),
(12, 1, 'C', '2024-12-28', '22UCS624', 'A'),
(13, 1, 'C', '2024-12-28', '22UCS627', 'P'),
(14, 1, 'C', '2024-12-28', '22UCS628', 'A'),
(16, 1, 'A', '2024-12-21', 't', 'P'),
(17, 2, 'A', '2024-12-21', 't', 'A'),
(18, 3, 'A', '2024-12-21', 't', 'P'),
(19, 4, 'A', '2024-12-21', 't', 'P'),
(20, 5, 'A', '2024-12-21', 't', 'A'),
(21, 1, 'B', '2024-12-20', 't', 'A'),
(22, 2, 'B', '2024-12-20', 't', 'P'),
(23, 3, 'B', '2024-12-20', 't', '-'),
(24, 4, 'B', '2024-12-20', 't', 'A'),
(25, 5, 'B', '2024-12-20', 't', 'P'),
(26, 1, 'C', '2024-12-19', 't', 'P'),
(27, 2, 'C', '2024-12-19', 't', 'P'),
(28, 3, 'C', '2024-12-19', 't', '-'),
(29, 4, 'C', '2024-12-19', 't', 'A'),
(30, 5, 'C', '2024-12-19', 't', 'A'),
(31, 1, 'C', '2024-12-29', '22UCS620', 'P'),
(32, 1, 'C', '2024-12-29', '22UCS622', 'P'),
(33, 1, 'C', '2024-12-29', '22UCS624', 'P'),
(34, 1, 'C', '2024-12-29', '22UCS627', 'A'),
(35, 1, 'C', '2024-12-29', '22UCS626', 'P'),
(36, 1, 'C', '2024-12-29', '22UCS621', 'P'),
(37, 1, 'C', '2024-12-29', '22UCS628', 'A'),
(38, 1, 'C', '2024-12-29', 't', 'P');

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `class_id` int NOT NULL,
  `class_name` varchar(255) NOT NULL,
  `department_id` varchar(16) DEFAULT NULL,
  `year` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`class_id`, `class_name`, `department_id`, `year`) VALUES
(1, 'CS First Year', 'DPCS', 1),
(2, 'CS Second Year', 'DPCS', 2),
(3, 'CS Third Year', 'DPCS', 3),
(4, 'Botany First Year', 'DPBT', 1),
(5, 'Botany Second Year', 'DPBT', 2),
(6, 'Botany Third Year', 'DPBT', 3),
(7, 'Chemistry First Year', 'DPCH', 1),
(8, 'Chemistry Second Year', 'DPCH', 2),
(9, 'Chemistry Third Year', 'DPCH', 3),
(10, 'Physics First Year', 'DPPH', 1),
(11, 'Physics Second Year', 'DPPH', 2),
(12, 'Physics Third Year', 'DPPH', 3),
(13, 'Tamil First Year', 'DPTA', 1),
(14, 'Tamil Second Year', 'DPTA', 2),
(15, 'Tamil Third Year', 'DPTA', 3),
(16, 'English First Year', 'DPEN', 1),
(17, 'English Second Year', 'DPEN', 2),
(18, 'English Third Year', 'DPEN', 3);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` int NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `department_id` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `course_name`, `department_id`) VALUES
(1, 'Introduction to Botany', 'DPBT'),
(2, 'Plant Diversity I: Algae, Fungi, and Bryophytes', 'DPBT'),
(3, 'Cell Biology and Cytogenetics', 'DPBT'),
(4, 'Biomolecules and Plant Biochemistry', 'DPBT'),
(5, 'Microbiology and Plant Pathology', 'DPBT'),
(6, 'Laboratory Practical I', 'DPBT'),
(7, 'Plant Diversity II: Pteridophytes and Gymnosperms', 'DPBT'),
(8, 'Anatomy and Developmental Biology of Angiosperms', 'DPBT'),
(9, 'Taxonomy and Systematics of Angiosperms', 'DPBT'),
(10, 'Ecology and Environmental Biology', 'DPBT'),
(11, 'Genetics and Molecular Biology', 'DPBT'),
(12, 'Laboratory Practical II', 'DPBT'),
(13, 'Plant Physiology and Metabolism', 'DPBT'),
(14, 'Economic Botany and Ethnobotany', 'DPBT'),
(15, 'Plant Biotechnology and Genetic Engineering', 'DPBT'),
(16, 'Plant Ecology and Conservation Biology', 'DPBT'),
(17, 'Research Techniques in Botany', 'DPBT'),
(18, 'Project Work / Internship', 'DPBT'),
(19, 'general tamil two', 'DPTA'),
(20, 'general tamil three', 'DPTA'),
(21, 'general tamil four', 'DPTA'),
(22, 'History of Tamil Literature', 'DPTA'),
(23, 'Tamil Folk Literature', 'DPTA'),
(24, 'Contemporary Tamil Poetry', 'DPTA'),
(25, 'Tamil Novel: Evolution and Themes', 'DPTA'),
(26, 'Tamil Cultural Studies', 'DPTA'),
(27, 'Comparative Literature: Tamil and World Literatures', 'DPTA'),
(28, 'Philosophical Trends in Tamil Literature', 'DPTA'),
(29, 'Tamil Dramas and Plays', 'DPTA'),
(30, 'Translation Studies: Tamil to Other Languages', 'DPTA'),
(31, 'Fundamentals of Computer Science', 'DPCS'),
(32, 'Programming in C', 'DPCS'),
(33, 'Digital Logic and Computer Organization', 'DPCS'),
(34, 'Mathematics for Computer Science', 'DPCS'),
(35, 'Data Structures and Algorithms', 'DPCS'),
(36, 'Introduction to Operating Systems', 'DPCS'),
(37, 'Object-Oriented Programming with Java', 'DPCS'),
(38, 'Database Management Systems', 'DPCS'),
(39, 'Computer Networks', 'DPCS'),
(40, 'Software Engineering', 'DPCS'),
(41, 'Web Development Technologies', 'DPCS'),
(42, 'Advanced Data Structures', 'DPCS'),
(43, 'Artificial Intelligence and Machine Learning', 'DPCS'),
(44, 'Cloud Computing and Virtualization', 'DPCS'),
(45, 'Cyber Security and Ethical Hacking', 'DPCS'),
(46, 'Big Data Analytics', 'DPCS'),
(47, 'Mobile Application Development', 'DPCS'),
(48, 'Project Work / Internship', 'DPCS'),
(49, 'Basic Concepts in Chemistry', 'DPCH'),
(50, 'Organic Chemistry - Fundamentals', 'DPCH'),
(51, 'Physical Chemistry: Thermodynamics', 'DPCH'),
(52, 'Analytical Chemistry: Basic Techniques', 'DPCH'),
(53, 'Environmental Chemistry', 'DPCH'),
(54, 'Laboratory Practical I', 'DPCH'),
(55, 'Inorganic Chemistry: Coordination Compounds', 'DPCH'),
(56, 'Organic Chemistry: Reaction Mechanisms', 'DPCH'),
(57, 'Physical Chemistry: Chemical Kinetics', 'DPCH'),
(58, 'Industrial Chemistry', 'DPCH'),
(59, 'Spectroscopy in Chemistry', 'DPCH'),
(60, 'Laboratory Practical II', 'DPCH'),
(61, 'Advanced Organic Synthesis', 'DPCH'),
(62, 'Medicinal Chemistry', 'DPCH'),
(63, 'Material Chemistry and Nanotechnology', 'DPCH'),
(64, 'Electrochemistry and Photochemistry', 'DPCH'),
(65, 'Green Chemistry and Sustainable Practices', 'DPCH'),
(66, 'Project Work / Internship', 'DPCH'),
(67, 'Mechanics and Properties of Matter', 'DPPH'),
(68, 'Waves and Oscillations', 'DPPH'),
(69, 'Thermal Physics and Thermodynamics', 'DPPH'),
(70, 'Mathematical Physics I', 'DPPH'),
(71, 'Electricity and Magnetism', 'DPPH'),
(72, 'Laboratory Practical I', 'DPPH'),
(73, 'Optics and Wave Mechanics', 'DPPH'),
(74, 'Quantum Mechanics I', 'DPPH'),
(75, 'Electromagnetic Theory', 'DPPH'),
(76, 'Solid State Physics', 'DPPH'),
(77, 'Statistical Physics', 'DPPH'),
(78, 'Laboratory Practical II', 'DPPH'),
(79, 'Quantum Mechanics II', 'DPPH'),
(80, 'Nuclear and Particle Physics', 'DPPH'),
(81, 'Astrophysics and Cosmology', 'DPPH'),
(82, 'Electronics and Instrumentation', 'DPPH'),
(83, 'Advanced Computational Physics', 'DPPH'),
(84, 'Project Work / Internship', 'DPPH'),
(85, 'general english one', 'DPEN'),
(86, 'general english two', 'DPEN'),
(87, 'general english three', 'DPEN'),
(88, 'general english four', 'DPEN'),
(89, 'Grammar and Composition', 'DPEN'),
(90, 'Introduction to Literary Forms', 'DPEN'),
(91, 'Elizabethan Drama', 'DPEN'),
(92, 'Romantic Poetry', 'DPEN'),
(93, 'Victorian Novel', 'DPEN'),
(94, 'Modern British Drama', 'DPEN'),
(95, 'Literary Criticism: Classical to Romantic', 'DPEN'),
(96, 'Indian Writing in English', 'DPEN'),
(97, 'Modernist and Postmodernist Literature', 'DPEN'),
(98, 'American Literature', 'DPEN'),
(99, 'Postcolonial Literature', 'DPEN'),
(100, 'World Literature in Translation', 'DPEN'),
(101, 'Creative Writing and Advanced Composition', 'DPEN'),
(102, 'Research Methodology in English Studies', 'DPEN');

-- --------------------------------------------------------

--
-- Table structure for table `course_enrolled`
--

CREATE TABLE `course_enrolled` (
  `student_id` varchar(16) NOT NULL,
  `course_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `course_enrolled`
--

INSERT INTO `course_enrolled` (`student_id`, `course_id`) VALUES
('24UCS600', 32),
('24UCS601', 32),
('24UCS602', 32),
('24UCS603', 32),
('24UCS604', 32),
('24UCS605', 32),
('24UCS606', 32),
('24UCS607', 32),
('24UCS608', 32),
('24UCS609', 32),
('23UCS610', 38),
('23UCS611', 38),
('23UCS612', 38),
('23UCS613', 38),
('23UCS614', 38),
('23UCS615', 38),
('23UCS616', 38),
('23UCS617', 38),
('23UCS618', 38),
('23UCS619', 38),
('22UCS620', 40),
('22UCS621', 40),
('22UCS622', 40),
('22UCS624', 40),
('22UCS626', 40),
('22UCS627', 40),
('22UCS628', 40),
('t', 40),
('22UCS620', 43),
('22UCS621', 43),
('22UCS622', 43),
('22UCS624', 43),
('22UCS626', 43),
('22UCS627', 43),
('22UCS628', 43),
('t', 43),
('t', 44),
('22UCS620', 47),
('22UCS621', 47),
('22UCS622', 47),
('22UCS624', 47),
('22UCS626', 47),
('22UCS627', 47),
('22UCS628', 47),
('22UCS620', 48),
('22UCS621', 48),
('22UCS622', 48),
('22UCS624', 48),
('22UCS626', 48),
('22UCS627', 48),
('22UCS628', 48),
('t', 48);

-- --------------------------------------------------------

--
-- Table structure for table `course_schedule`
--

CREATE TABLE `course_schedule` (
  `schedule_id` int NOT NULL,
  `hour` int NOT NULL,
  `day_order` char(1) NOT NULL,
  `class_id` int DEFAULT NULL,
  `faculty_id` varchar(16) DEFAULT NULL,
  `course_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `course_schedule`
--

INSERT INTO `course_schedule` (`schedule_id`, `hour`, `day_order`, `class_id`, `faculty_id`, `course_id`) VALUES
(61, 1, 'A', 1, '01ccs123', 32),
(62, 2, 'A', 3, '01ccs123', 37),
(63, 3, 'A', NULL, '01ccs123', NULL),
(64, 4, 'A', 2, '01ccs123', 38),
(65, 5, 'A', NULL, '01ccs123', NULL),
(66, 1, 'B', 2, '01ccs123', 38),
(67, 2, 'B', NULL, '01ccs123', NULL),
(68, 3, 'B', NULL, '01ccs123', NULL),
(69, 4, 'B', 1, '01ccs123', 32),
(70, 5, 'B', 3, '01ccs123', 37),
(71, 1, 'C', 3, '01ccs123', 48),
(72, 2, 'C', 3, '01ccs123', 48),
(73, 3, 'C', 3, '01ccs123', 48),
(74, 4, 'C', NULL, '01ccs123', NULL),
(75, 5, 'C', NULL, '01ccs123', NULL),
(76, 1, 'D', NULL, '01ccs123', NULL),
(77, 2, 'D', NULL, '01ccs123', NULL),
(78, 3, 'D', 1, '01ccs123', 32),
(79, 4, 'D', 3, '01ccs123', 37),
(80, 5, 'D', 3, '01ccs123', 37),
(81, 1, 'E', 1, '01ccs123', 32),
(82, 2, 'E', 1, '01ccs123', 32),
(83, 3, 'E', NULL, '01ccs123', NULL),
(84, 4, 'E', NULL, '01ccs123', NULL),
(85, 5, 'E', 3, '01ccs123', 37),
(86, 1, 'F', NULL, '01ccs123', NULL),
(87, 2, 'F', 3, '01ccs123', 37),
(88, 3, 'F', 3, '01ccs123', 37),
(89, 4, 'F', 2, '01ccs123', 38),
(90, 5, 'F', NULL, '01ccs123', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `course_to_class`
--

CREATE TABLE `course_to_class` (
  `course_id` int NOT NULL,
  `class_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `department_id` varchar(16) NOT NULL,
  `department_name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_id`, `department_name`) VALUES
('DPBT', 'Botany'),
('DPCH', 'Chemistry'),
('DPCS', 'Computer Science'),
('DPEN', 'English'),
('DPPH', 'Physics'),
('DPTA', 'Tamil');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `faculty_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `department_id` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`faculty_id`, `password`, `name`, `department_id`) VALUES
('01ccs123', '$2b$10$tg9ocgjIrUWXjjqXGUK27OjDPd3oaDOa2svouO8JiiH7i6MVEvszq', 'Hari', 'DPCS');

-- --------------------------------------------------------

--
-- Table structure for table `Faculty_course_Assigned`
--

CREATE TABLE `Faculty_course_Assigned` (
  `faculty_id` varchar(16) NOT NULL,
  `course_id` int NOT NULL,
  `class_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Faculty_course_Assigned`
--

INSERT INTO `Faculty_course_Assigned` (`faculty_id`, `course_id`, `class_id`) VALUES
('01ccs123', 32, 1),
('01ccs123', 38, 2),
('01ccs123', 37, 3),
('01ccs123', 48, 3);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` varchar(16) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `class_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `name`, `password`, `class_id`) VALUES
('22UBO620', 'Anika', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 6),
('22UBO621', 'Anika', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 6),
('22UBO622', 'Swara', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 6),
('22UBO623', 'Arjun', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 6),
('22UBO624', 'Harsh', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 6),
('22UBO625', 'Aarushi', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 6),
('22UBO626', 'Vimal', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 6),
('22UBO627', 'Keshav', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 6),
('22UBO628', 'Meera', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 6),
('22UBO629', 'Myra', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 6),
('22UCH620', 'Vivek', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 9),
('22UCH621', 'Manish', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 9),
('22UCH622', 'Meera', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 9),
('22UCH623', 'Prisha', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 9),
('22UCH624', 'Ayaan', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 9),
('22UCH625', 'Pankaj', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 9),
('22UCH626', 'Asmita', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 9),
('22UCH627', 'Saanvi', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 9),
('22UCH628', 'Swara', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 9),
('22UCH629', 'Shanaya', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 9),
('22UCS620', 'Lavanya', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 3),
('22UCS621', 'Anvi', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 3),
('22UCS622', 'Rohan', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 3),
('22UCS623', 'Kartik', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 3),
('22UCS624', 'Manvi', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 3),
('22UCS625', 'Chirag', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 3),
('22UCS626', 'Tamil', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 3),
('22UCS627', 'Tara', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 3),
('22UCS628', 'Priya', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 3),
('22UCS629', 'Mohan', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 3),
('22UEN620', 'Kabir', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 18),
('22UEN621', 'Asmita', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 18),
('22UEN622', 'Nikhil', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 18),
('22UEN623', 'Sneha', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 18),
('22UEN624', 'Aarav', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 18),
('22UEN625', 'Mahi', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 18),
('22UEN626', 'Kunal', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 18),
('22UEN627', 'Tanya', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 18),
('22UEN628', 'Ekta', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 18),
('22UEN629', 'Bhavya', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 18),
('22UPH620', 'Nidhi', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 12),
('22UPH621', 'Riya', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 12),
('22UPH622', 'Deepa', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 12),
('22UPH623', 'Kavya', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 12),
('22UPH624', 'Samaira', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 12),
('22UPH625', 'Anushka', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 12),
('22UPH626', 'Ritika', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 12),
('22UPH627', 'Anushka', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 12),
('22UPH628', 'Harini', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 12),
('22UPH629', 'Dev', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 12),
('22UTA620', 'Rupali', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 15),
('22UTA621', 'Navya', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 15),
('22UTA622', 'Charvi', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 15),
('22UTA623', 'Sneha', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 15),
('22UTA624', 'Aditi', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 15),
('22UTA625', 'Yash', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 15),
('22UTA626', 'Ayaan', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 15),
('22UTA627', 'Niharika', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 15),
('22UTA628', 'Aryan', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 15),
('22UTA629', 'Priya', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 15),
('23UBO610', 'Kabir', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 5),
('23UBO611', 'Bhavya', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 5),
('23UBO612', 'Vivaan', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 5),
('23UBO613', 'Nidhi', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 5),
('23UBO614', 'Soham', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 5),
('23UBO615', 'Soham', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 5),
('23UBO616', 'Trisha', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 5),
('23UBO617', 'Saanvi', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 5),
('23UBO618', 'Rupali', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 5),
('23UBO619', 'Tushar', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 5),
('23UCH610', 'Abhay', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 8),
('23UCH611', 'Swara', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 8),
('23UCH612', 'Aarohi', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 8),
('23UCH613', 'Vimal', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 8),
('23UCH614', 'Aanya', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 8),
('23UCH615', 'Gauri', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 8),
('23UCH616', 'Ekta', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 8),
('23UCH617', 'Vimal', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 8),
('23UCH618', 'Ashwin', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 8),
('23UCH619', 'Tanya', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 8),
('23UCS610', 'Aanya', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 2),
('23UCS611', 'Vimal', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 2),
('23UCS612', 'Lakshay', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 2),
('23UCS613', 'Ashwin', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 2),
('23UCS614', 'Asmita', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 2),
('23UCS615', 'Charvi', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 2),
('23UCS616', 'Akash', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 2),
('23UCS617', 'Jhanvi', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 2),
('23UCS618', 'Aditi', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 2),
('23UCS619', 'Jay', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 2),
('23UEN610', 'Kavya', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 17),
('23UEN611', 'Anushka', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 17),
('23UEN612', 'Raj', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 17),
('23UEN613', 'Dev', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 17),
('23UEN614', 'Bhavya', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 17),
('23UEN615', 'Aditya', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 17),
('23UEN616', 'Ananya', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 17),
('23UEN617', 'Nidhi', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 17),
('23UEN618', 'Kunal', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 17),
('23UEN619', 'Priya', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 17),
('23UPH610', 'Sneha', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 11),
('23UPH611', 'Kavya', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 11),
('23UPH612', 'Anushka', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 11),
('23UPH613', 'Aditi', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 11),
('23UPH614', 'Riya', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 11),
('23UPH615', 'Aarushi', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 11),
('23UPH616', 'Mahi', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 11),
('23UPH617', 'Yash', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 11),
('23UPH618', 'Rakesh', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 11),
('23UPH619', 'Aryan', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 11),
('23UTA610', 'Sonal', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 14),
('23UTA611', 'Rakesh', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 14),
('23UTA612', 'Aryan', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 14),
('23UTA613', 'Veer', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 14),
('23UTA614', 'Akash', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 14),
('23UTA615', 'Meera', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 14),
('23UTA616', 'Aryan', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 14),
('23UTA617', 'Shreya', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 14),
('23UTA618', 'Lavanya', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 14),
('23UTA619', 'Mohan', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 14),
('24UBO600', 'Kartik', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 4),
('24UBO601', 'Ira', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 4),
('24UBO602', 'Abhay', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 4),
('24UBO603', 'Asmita', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 4),
('24UBO604', 'Vikram', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 4),
('24UBO605', 'Surbhi', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 4),
('24UBO606', 'Ritika', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 4),
('24UBO607', 'Kabir', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 4),
('24UBO608', 'Sahil', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 4),
('24UBO609', 'Aarohi', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 4),
('24UCH600', 'Mohan', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 7),
('24UCH601', 'Kavya', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 7),
('24UCH602', 'Kartik', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 7),
('24UCH603', 'Manvi', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 7),
('24UCH604', 'Aarav', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 7),
('24UCH605', 'Arjun', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 7),
('24UCH606', 'Sanjay', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 7),
('24UCH607', 'Vivaan', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 7),
('24UCH608', 'Ananya', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 7),
('24UCH609', 'Ritika', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 7),
('24UCS600', 'Chirag', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 1),
('24UCS601', 'Kartik', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 1),
('24UCS602', 'Veer', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 1),
('24UCS603', 'Ishaan', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 1),
('24UCS604', 'Ashwin', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 1),
('24UCS605', 'Anika', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 1),
('24UCS606', 'Nidhi', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 1),
('24UCS607', 'Sejal', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 1),
('24UCS608', 'Shanaya', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 1),
('24UCS609', 'Surbhi', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 1),
('24ucs999', 'nice name', '$2b$10$SYUxrkwF01M614uVHbKwf.dhMkRbMyUDmZ31osoWUY2OkIl.1tnBO', 1),
('24UEN600', 'Tara', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 16),
('24UEN601', 'Kabir', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 16),
('24UEN602', 'Tushar', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 16),
('24UEN603', 'Nidhi', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 16),
('24UEN604', 'Asmita', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 16),
('24UEN605', 'Abhay', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 16),
('24UEN606', 'Jhanvi', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 16),
('24UEN607', 'Riya', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 16),
('24UEN608', 'Ekta', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 16),
('24UEN609', 'Mohan', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 16),
('24UPH600', 'Manvi', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 10),
('24UPH601', 'Akash', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 10),
('24UPH602', 'Arjun', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 10),
('24UPH603', 'Shanaya', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 10),
('24UPH604', 'Aryan', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 10),
('24UPH605', 'Anushka', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 10),
('24UPH606', 'Rudra', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 10),
('24UPH607', 'Tushar', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 10),
('24UPH608', 'Anushka', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 10),
('24UPH609', 'Dhruv', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 10),
('24UTA600', 'Mohan', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 13),
('24UTA601', 'Jhanvi', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 13),
('24UTA602', 'Gauri', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 13),
('24UTA603', 'Kunal', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 13),
('24UTA604', 'Lakshay', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 13),
('24UTA605', 'Keshav', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 13),
('24UTA606', 'Anvi', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 13),
('24UTA607', 'Meera', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 13),
('24UTA608', 'Ishita', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 13),
('24UTA609', 'Parth', '$2b$12$Zqk1kcg8l389VnCBhU3p0uZMn0QbLbxMtuppmF/dI4ykowE00AzT2', 13),
('t', 'tamil', '$2a$12$JKpa73XMRKcqj9NmEbd0GujXRgwBwYZW3xZS.Pz.pOJBSroGBmQAS', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminCred`
--
ALTER TABLE `adminCred`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendance_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`class_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `course_enrolled`
--
ALTER TABLE `course_enrolled`
  ADD PRIMARY KEY (`student_id`,`course_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `course_schedule`
--
ALTER TABLE `course_schedule`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `course_schedule_ibfk_1` (`class_id`),
  ADD KEY `course_schedule_ibfk_2` (`faculty_id`),
  ADD KEY `course_schedule_ibfk_3` (`course_id`);

--
-- Indexes for table `course_to_class`
--
ALTER TABLE `course_to_class`
  ADD PRIMARY KEY (`course_id`,`class_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`faculty_id`),
  ADD KEY `FK_fac_dprt` (`department_id`);

--
-- Indexes for table `Faculty_course_Assigned`
--
ALTER TABLE `Faculty_course_Assigned`
  ADD PRIMARY KEY (`faculty_id`,`course_id`),
  ADD KEY `Faculty_course_Assigned_ibfk_2` (`course_id`),
  ADD KEY `Faculty_course_Assigned_ibfk_3` (`class_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `class_id` (`class_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `attendance_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `class_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `course_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `course_schedule`
--
ALTER TABLE `course_schedule`
  MODIFY `schedule_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`);

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`);

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`);

--
-- Constraints for table `course_enrolled`
--
ALTER TABLE `course_enrolled`
  ADD CONSTRAINT `course_enrolled_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  ADD CONSTRAINT `course_enrolled_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`);

--
-- Constraints for table `course_schedule`
--
ALTER TABLE `course_schedule`
  ADD CONSTRAINT `course_schedule_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `course_schedule_ibfk_2` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `course_schedule_ibfk_3` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `course_to_class`
--
ALTER TABLE `course_to_class`
  ADD CONSTRAINT `course_to_class_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  ADD CONSTRAINT `course_to_class_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`);

--
-- Constraints for table `faculty`
--
ALTER TABLE `faculty`
  ADD CONSTRAINT `FK_fac_dprt` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `Faculty_course_Assigned`
--
ALTER TABLE `Faculty_course_Assigned`
  ADD CONSTRAINT `Faculty_course_Assigned_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `Faculty_course_Assigned_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `Faculty_course_Assigned_ibfk_3` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
