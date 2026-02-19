package com.sudhanshu.calculator;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

class CalculatorServiceTest {

    private final CalculatorService calculator = new CalculatorService();

    // -------- ADD TESTS (5) --------

    @Test
    void testAddPositive() {
        assertEquals(5, calculator.add(2, 3));
    }

    @Test
    void testAddNegative() {
        assertEquals(-1, calculator.add(2, -3));
    }

    @Test
    void testAddBothNegative() {
        assertEquals(-5, calculator.add(-2, -3));
    }

    @Test
    void testAddWithZero() {
        assertEquals(5, calculator.add(5, 0));
    }

    @Test
    void testAddLargeNumbers() {
        assertEquals(2000, calculator.add(1000, 1000));
    }

    // -------- SUBTRACT TESTS (5) --------

    @Test
    void testSubtractPositive() {
        assertEquals(1, calculator.subtract(3, 2));
    }

    @Test
    void testSubtractNegative() {
        assertEquals(-5, calculator.subtract(-3, 2));
    }

    @Test
    void testSubtractBothNegative() {
        assertEquals(1, calculator.subtract(-2, -3));
    }

    @Test
    void testSubtractWithZero() {
        assertEquals(5, calculator.subtract(5, 0));
    }

    @Test
    void testSubtractLargeNumbers() {
        assertEquals(500, calculator.subtract(1500, 1000));
    }

    // -------- MULTIPLY TESTS (5) --------

    @Test
    void testMultiplyPositive() {
        assertEquals(6, calculator.multiply(2, 3));
    }

    @Test
    void testMultiplyNegative() {
        assertEquals(-6, calculator.multiply(-2, 3));
    }

    @Test
    void testMultiplyBothNegative() {
        assertEquals(6, calculator.multiply(-2, -3));
    }

    @Test
    void testMultiplyWithZero() {
        assertEquals(0, calculator.multiply(5, 0));
    }

    @Test
    void testMultiplyLargeNumbers() {
        assertEquals(1000000, calculator.multiply(1000, 1000));
    }

    // -------- DIVIDE TESTS (5) --------

    @Test
    void testDividePositive() {
        assertEquals(2, calculator.divide(6, 3));
    }

    @Test
    void testDivideNegative() {
        assertEquals(-2, calculator.divide(-6, 3));
    }

    @Test
    void testDivideBothNegative() {
        assertEquals(2, calculator.divide(-6, -3));
    }

    @Test
    void testDivideWithZeroNumerator() {
        assertEquals(0, calculator.divide(0, 5));
    }

    @Test
    void testDivideByZeroThrows() {
        assertThrows(IllegalArgumentException.class,
                () -> calculator.divide(5, 0));
    }
}
