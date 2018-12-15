#define CURRENT_YEAR 2018

/**
 * @brief Get people age.
 *
 * @param name          Name of the person.
 * @param date_of_birth DOB of the person.
 *
 * @return Age of the person.
 */
int getAge(char* name, int date_of_birth)
{
    return CURRENT_YEAR - date_of_birth;
} 

/**
 * @brief Main function.
 *
 * @return 0
 */
int main()
{
    int age = getAge("Adrien", 1996);

    return 0;
}
