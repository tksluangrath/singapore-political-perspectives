# Statistical Analysis of Political Perspectives in Singapore

A statistical analysis project using SAS to examine how internet access, social media usage, and political opinions intersect in Singapore. This was a group project for MATH 309: SAS and Data Management at James Madison University.

## What We Studied

We analyzed survey data from Pew Research Center's 2022 Global Attitudes Survey to understand political perspectives in Singapore. The project focused on three main questions:

1. **How does internet access relate to social media use and political news spread?**
2. **How does internet access influence opinions of the United States?**
3. **How do Singaporean opinions of China correlate with the overall China-Singapore relationship?**

## Why Singapore?

Singapore is an interesting case study - it's a highly developed, technologically advanced country with 6 million people in 720 square kilometers. About 70% of the population is Chinese, and it has strong economic ties with both the US and China. The country's position as a major player in Southeast Asia makes understanding its political perspectives particularly relevant.

## The Data

Used Pew Research Center's 2022 Global Attitudes Survey:
- **Sample size:** 1,000 respondents in Singapore
- **Margin of error:** ±3.5%
- **Collection method:** Random digital dial (RDD) probability sampling via phone interviews
- **Languages offered:** Bahasa Malay, Mandarin, English
- **Survey period:** March 7 - April 24, 2022

Interviews were conducted using computer-assisted telephone interviews (CATI) with up to seven callback attempts. All respondents were 18 or older.

## Our Approach

### Question 1: Internet Access, Social Media, and Political News

**Hypothesis:** Increasing internet access in Singapore is positively correlated with social media usage and the spread of political news.

**Method:** Logistic regression with internet use as the response variable and four predictors:
- Cell phone ownership
- Belief that social media can change minds on political issues
- Belief that social media raises public awareness
- Belief that social media makes people easier to manipulate

**Key findings:**
- People who believe social media raises awareness were 0.305× as likely to have internet access (reduced model)
- People who believe social media enables manipulation were 0.427× as likely to have internet access
- Full model: 46% concordance; Reduced model: 40% concordance
- Not all predictors were significant, suggesting we could have chosen better variables

### Question 2: Internet Access and Opinions of the US

**Hypothesis:** Increasing internet access in Singapore is positively correlated with favorable opinions of the United States.

**Method:** Logistic regression with six predictors including cell phone ownership, favorability toward the US, perception of US global influence, reliability as a partner, and opinion on the Afghanistan withdrawal.

**Key findings:**
- People who thought the US withdrawal from Afghanistan was handled well were 2.396× more likely to have internet access
- People who thought US global influence was growing were 1.773× more likely to have internet access
- Model concordance: 59.8%
- Three of six predictors were not significant, but removing them decreased model performance

### Question 3: Singaporean Opinions on China

**Hypothesis:** Singaporeans' attitudes toward China are positively correlated with the overall dynamics in the China-Singapore relationship.

**Method:** Logistic regression examining how favorability toward China, opinions on what brings nations together, perception of China's growing influence, concerns about Chinese political involvement, and confidence in Xi Jinping relate to overall China-Singapore relations.

**Key findings:**
- Confidence in Xi Jinping was the only significant predictor
- People with positive views of China-Singapore relations were 1.484× more likely to have confidence in Xi Jinping (full model)
- Full model: 52% concordance; Reduced model: 29% concordance
- Most predictors were not significant, indicating poor variable selection

## What We Learned

**Technical takeaways:**
- Choosing the right predictor variables is crucial - we struggled with this across all three questions
- Sometimes keeping insignificant predictors in the model improves overall concordance
- Logistic regression requires careful interpretation, especially when dealing with survey data
- Sample size and question wording matter a lot for statistical analysis

**About Singapore:**
- The relationship between internet access and political opinions is complex and not straightforward
- Singapore's position between the US and China creates interesting dynamics in public opinion
- Our models had relatively low concordance (29-60%), suggesting we missed important factors

## Limitations

- Cross-sectional data (snapshot in time, not longitudinal)
- Limited sample size (n=1,000)
- We may not have selected the best predictor variables
- Survey responses subject to social desirability bias
- Couldn't establish causation, only correlation

If we redid this, we'd include variables like political ideology, economic class, education level, and age demographics.

## Technical Details

**Tools:** SAS (proc logistic for logistic regression)

**Statistical method:** Logistic regression with binary outcomes

**Significance level:** α = 0.05

**Key techniques:**
- Data cleaning (removing "Don't Know" and "Refused" responses)
- Binary recoding of categorical variables
- Model reduction based on predictor significance
- Odds ratio interpretation

## Team

This was a collaborative project with Ulises J Sarabia and Erik Snowsill for Professor Beth Cochran's MATH 309 course at James Madison University (Fall 2023).

## References

- Pew Research Center (2022). Global Attitudes Survey
- Central Intelligence Agency. The World Factbook: Singapore
- MIT study on false news spread on social media (2018)
- Various sources on Singapore-US and Singapore-China relations

## Contact

**Author**: Terrance Luangrath

**📧 Email:** [tksluangrath@gmail.com](mailto:tksluangrath@gmail.com)  
**💼 LinkedIn:** [![LinkedIn](https://img.shields.io/badge/LinkedIn-%230077B5.svg?logo=linkedin&logoColor=white)](https://www.linkedin.com/in/terranceluangrath/)  
**👨‍💻 GitHub:** [![GitHub](https://img.shields.io/badge/GitHub-181717.svg?logo=github&logoColor=white)](https://github.com/tksluangrath)

---

*Note: This was an academic project completed in December 2023. The analysis reflects our learning process with SAS and statistical modeling, including the mistakes and limitations we encountered along the way.*
