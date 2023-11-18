import { executeQuery } from "../functions/executeQuery";
import logger from "../config/logger";

const getAllContributorsBooks = async () => {
    try {
        const query = "CALL AllContributorsAndBooks()";
        const result = await executeQuery(query);
        return result;
    } catch (error) {
        logger.error('Getting all contributors and books error at service: ');
        console.error(error);
        return error;
    }
}

export default {
    getAllContributorsBooks,
}
