#pragma once

#include <cstddef>
#include <array>
template <size_t Rows, size_t Cols, typename T = double>
class Matrix
{
   public:
   private:
    std::array<T, Rows * Cols> m_data{};

   public:
    Matrix() = default;

    const T &
    operator()(const size_t row, const size_t col) const
    {
        return m_data[IndexFromRowCol(row, col)];
    }

    void
    Set(const size_t row, const size_t col, const T value)
    {
        m_data[IndexFromRowCol(row, col)] = value;
    }

   private:
    [[nodiscard]] const size_t
    IndexFromRowCol(const size_t row, const size_t col) const
    {
        return (row * Cols) + col;
    }

    void
    CheckRange(const size_t row, const size_t col)
    {
        static_assert(row < Rows, "Matrix row out of range!");
        static_assert(col < Cols, "Matrix column out of range!");
    }
};
